import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncomeSpendingCard extends StatelessWidget {
  final int totalIncome;
  final int totalspending;
  const IncomeSpendingCard(
      {super.key, required this.totalIncome, required this.totalspending});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
      child: Container(
        height: 138.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 38.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  child: Icon(
                    Icons.arrow_downward,
                    size: 30,
                    // weight: 90,
                    color: theme.colorScheme.primaryContainer,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  totalIncome.toString(),
                  style:
                      theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  "Income",
                  style:
                      theme.textTheme.bodySmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
            Container(
              width: 1,
              height: 90,
              color: theme.colorScheme.primary,
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 38.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  child: Icon(
                    Icons.arrow_upward,
                    color: theme.colorScheme.primaryContainer,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  totalspending.toString(),
                  style:
                      theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  "Spending",
                  style:
                      theme.textTheme.bodySmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
