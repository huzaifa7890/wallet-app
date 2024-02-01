import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:walletapp/constant/app_assets_images.dart';
import 'package:walletapp/feature/homepage/widgets/income_spending_card.dart';
import 'package:walletapp/feature/homepage/widgets/my_cards.dart';
import 'package:walletapp/feature/transaction/widgets/transactions_item.dart';
import 'package:walletapp/provider/transaction_provider.dart';

class HomePageItem extends ConsumerStatefulWidget {
  const HomePageItem({super.key});

  @override
  ConsumerState<HomePageItem> createState() => _HomePageItemState();
}

class _HomePageItemState extends ConsumerState<HomePageItem> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(transactionsProvider.notifier).fetchTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final transactions = ref.watch(transactionsProvider);
    final totalIncome = transactions
        .where((transaction) => transaction.income > 0)
        .fold<int>(0, (sum, transaction) => sum + transaction.income);
    final totalSpending = transactions
        .where((transaction) => transaction.spending > 0)
        .fold<int>(0, (sum, transaction) => sum + transaction.spending);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Current Balance",
                  style: theme.textTheme.bodySmall,
                ),
                SvgPicture.asset(
                  AppAssetsImages.bellIcon,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "\$ ${(totalIncome - totalSpending).toStringAsFixed(2)}",
              style: theme.textTheme.titleLarge,
            ),
          ),
          // Income Spending Card
          IncomeSpendingCard(
              totalIncome: totalIncome, totalspending: totalSpending),
          // Cards
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 22.h),
            child: Text(
              "Your cards",
              style: theme.textTheme.bodySmall,
            ),
          ),
          // Card
          const MyCards(
              imagePath: AppAssetsImages.cart1, rs: 1020.92, cardName: 'Visa'),
          // const SizedBox(height: 2),
          const MyCards(
              imagePath: AppAssetsImages.cart2,
              rs: 1890.30,
              cardName: 'MasterCard'),
          // Transactions
          Padding(
            padding:
                EdgeInsets.only(top: 15.w, left: 20.h, right: 20.h, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "View all",
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          // Records
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Today",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Column(
                children: transactions.map((transaction) {
                  return TransactionItem(transaction: transaction);
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
