import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:walletapp/feature/transaction/widgets/transaction_filters.dart';
import 'package:walletapp/feature/transaction/widgets/transactions_item.dart';
import 'package:walletapp/provider/transaction_provider.dart';

class TransactionScreen extends ConsumerStatefulWidget {
  const TransactionScreen({super.key});

  @override
  ConsumerState<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends ConsumerState<TransactionScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(transactionsProvider.notifier).fetchTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(selectedFilterProvider);
    final groupedTransactions = ref
        .watch(filteredTransactionsProvider.notifier)
        .filterAndGroupTransactions();
    final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: theme.colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: theme.colorScheme.primaryContainer,
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        "Transactions",
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => const TransactionFilter(),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: Text(
                        "Filter ",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (groupedTransactions.isEmpty)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "No Transaction Available",
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            for (var date in groupedTransactions.keys)
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd MMM yyyy').format(DateTime.parse(date)),
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    for (var transaction in groupedTransactions[date]!)
                      TransactionItem(transaction: transaction),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
