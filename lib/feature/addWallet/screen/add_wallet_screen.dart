import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:walletapp/models/transaction.dart';
import 'package:walletapp/provider/card_provider.dart';
import 'package:walletapp/provider/transaction_provider.dart';

class AddWalletScreen extends ConsumerStatefulWidget {
  const AddWalletScreen({Key? key}) : super(key: key);

  @override
  _AddWalletScreenState createState() => _AddWalletScreenState();
}

class _AddWalletScreenState extends ConsumerState<AddWalletScreen> {
  bool showTransactionFields = false;
  late String selectedImagePath = '';
  DateTime selectedDate = DateTime.now();
  final _nameController = TextEditingController();
  final _incomeController = TextEditingController();
  final _spendingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cardProvider.notifier).fetchCard();
      final cards = ref.read(cardProvider);
      if (cards.isNotEmpty) {
        final defaultBankName = cards.first.bankName;
        ref.read(selectedBankNameProvider.notifier).state = defaultBankName;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cards = ref.watch(cardProvider);
    final bankNames = cards.map((card) => card.bankName).toSet().toList();
    final theme = Theme.of(context);
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
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Transaction Screen',
          style: theme.textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (selectedImagePath.isEmpty)
                ElevatedButton(
                  onPressed: pickImage,
                  child: Text(
                    'Pick Image',
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              selectedImagePath.isNotEmpty
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(File(selectedImagePath)),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => selectDate(context),
                  child: AbsorbPointer(
                    child: TextField(
                      controller: TextEditingController()
                        ..text = "${selectedDate.toLocal()}".split(' ')[0],
                      decoration: const InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _incomeController,
                  decoration: const InputDecoration(
                    labelText: 'Income',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _spendingController,
                  decoration: const InputDecoration(
                    labelText: 'Spending',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Consumer(builder: ((BuildContext context, ref, child) {
                return DropdownButton<String>(
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      ref.read(selectedBankNameProvider.notifier).state =
                          newValue;
                    }
                  },
                  value: ref.watch(selectedBankNameProvider),
                  items:
                      bankNames.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: theme.textTheme.bodyLarge,
                      ),
                    );
                  }).toList(),
                );
              })),
              ElevatedButton(
                onPressed: () {
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
                      bankName: ref.read(selectedBankNameProvider),
                    );
                    ref
                        .read(transactionsProvider.notifier)
                        .addTransaction(transaction);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Transaction Added',
                        style: theme.textTheme.bodyMedium,
                      ),
                      dismissDirection: DismissDirection.down,
                      duration: const Duration(seconds: 1),
                    ));
                  }
                },
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
