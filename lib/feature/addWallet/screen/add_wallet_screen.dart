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
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              colorScheme: const ColorScheme.light(
                primary: Colors.black,
              ),
            ),
            child: child!,
          );
        },
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
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                onTap: pickImage,
                child: CircleAvatar(
                  radius: 45,
                  child: selectedImagePath.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: Image.file(File(selectedImagePath)),
                        )
                      : const Icon(Icons.camera),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Date',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () => selectDate(context),
                          child: AbsorbPointer(
                            child: TextField(
                              controller: TextEditingController()
                                ..text =
                                    "${selectedDate.toLocal()}".split(' ')[0],
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Income',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _incomeController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Spendings',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _spendingController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Bank',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Consumer(
                        builder: (context, ref, child) {
                          return DropdownButton<String>(
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                ref
                                    .read(selectedBankNameProvider.notifier)
                                    .state = newValue;
                              }
                            },
                            value: ref.watch(selectedBankNameProvider),
                            underline: const SizedBox(),
                            items: bankNames
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    value,
                                    style: theme.textTheme.bodyLarge
                                        ?.copyWith(color: Colors.black),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 200,
                height: 50,
                decoration: const BoxDecoration(),
                child: ElevatedButton(
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
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
