import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:walletapp/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIncome = transaction.income > transaction.spending;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transaction Details',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Name: ${transaction.name}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Date: ${DateFormat('yyyy-MM-dd').format(transaction.dateTime.toLocal())}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Income: ${transaction.income}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Spending: ${transaction.spending}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'BankName: ${transaction.bankName}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 8.h),
        child: Container(
          height: 64.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // color: isIncome ? Colors.green : Colors.red,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: theme.colorScheme.secondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        File(transaction.imagePath),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, top: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.name,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.black),
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd').format(transaction.dateTime),
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: theme.colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                isIncome
                    ? " \$${transaction.income.toStringAsFixed(2)}"
                    : "- \$${transaction.spending.toStringAsFixed(2)}",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isIncome ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
