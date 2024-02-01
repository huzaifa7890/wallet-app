import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:walletapp/models/transaction.dart';
import 'package:walletapp/provider/transaction_provider.dart';

class AddWalletScreen extends ConsumerStatefulWidget {
  const AddWalletScreen({Key? key}) : super(key: key);

  @override
  _AddWalletScreenState createState() => _AddWalletScreenState();
}

class _AddWalletScreenState extends ConsumerState<AddWalletScreen> {
  bool showTransactionFields = false;
  late String selectedImagePath;
  DateTime selectedDate = DateTime.now();
  final _nameController = TextEditingController();
  final _incomeController = TextEditingController();
  final _spendingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        final imagePath = pickedFile.path;

        setState(() {
          selectedImagePath = imagePath;
        });
      }
    }

    final transactionsNotifier = ref.read(transactionsProvider.notifier);

    Future<void> addTransaction() async {
      final name = _nameController.text;
      final income = int.tryParse(_incomeController.text);
      final spending = int.tryParse(_spendingController.text);

      if (income != null && spending != null) {
        final transaction = Transaction(
          name: name,
          dateTime: selectedDate,
          income: income,
          spending: spending,
          imagePath: selectedImagePath,
        );
        try {
          await transactionsNotifier.addTransaction(transaction);
          _nameController.clear();
          _incomeController.clear();
          _spendingController.clear();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Transaction added successfully!',
                style: TextStyle(color: Colors.amber),
              ),
            ),
          );
        } catch (error) {
          // Handle database errors
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error adding transaction')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields')),
        );
      }
    }

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        confirmText: "Confirm",
        fieldLabelText: "Confirm",
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showTransactionFields = !showTransactionFields;
                  });
                },
                child: const Text('Add Transaction?'),
              ),
              if (showTransactionFields)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: showTransactionFields ? 250.0 : 0.0,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: pickImage,
                        child: const Text('Pick Image'),
                      ),
                      Flexible(
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => selectDate(context),
                        child: AbsorbPointer(
                          child: TextField(
                            controller: TextEditingController()
                              ..text =
                                  "${selectedDate.toLocal()}".split(' ')[0],
                            decoration:
                                const InputDecoration(labelText: 'Date'),
                          ),
                        ),
                      ),
                      Flexible(
                        child: TextField(
                          controller: _incomeController,
                          decoration: InputDecoration(labelText: 'Income'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Flexible(
                        child: TextField(
                          controller: _spendingController,
                          decoration: InputDecoration(labelText: 'Spending'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
              ElevatedButton(
                onPressed: addTransaction,
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
