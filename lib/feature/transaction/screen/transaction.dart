import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walletapp/feature/transaction/widgets/transactions_item.dart';
import 'package:walletapp/models/transaction.dart';
import 'package:walletapp/provider/transaction_provider.dart';

class TransactionScreen extends ConsumerStatefulWidget {
  const TransactionScreen({super.key});

  @override
  ConsumerState<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends ConsumerState<TransactionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(transactionsProvider.notifier).fetchTransactions();
    });
  }

  Map<String, List<Transaction>> transactionsByDate(
      List<Transaction> transactions) {
    final dateViseTransactions = <String, List<Transaction>>{};

    for (var transaction in transactions) {
      final date = transaction.dateTime.toLocal().toString().split(' ')[0];
      if (!dateViseTransactions.containsKey(date)) {
        dateViseTransactions[date] = [];
      }
      dateViseTransactions[date]!.add(transaction);
    }
    return dateViseTransactions;
  }

  @override
  Widget build(BuildContext context) {
    final transactions = ref.watch(transactionsProvider);
    final theme = Theme.of(context);
    final groupedTransactions = transactionsByDate(transactions);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h, left: 5.w),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: theme.colorScheme.primaryContainer,
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Text(
                    "Transactions",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            for (var date in groupedTransactions.keys)
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    ...groupedTransactions[date]!.map((transaction) {
                      return TransactionItem(transaction: transaction);
                    }),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
