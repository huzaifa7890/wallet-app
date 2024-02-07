import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walletapp/provider/transaction_provider.dart';

class TransactionFilter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(selectedFilterProvider);
    return Drawer(
      child: Center(
        child: Column(
          children: [
            Text(
              "Filter Options",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                ref.read(selectedFilterProvider.notifier).state = 'All';
                Navigator.of(context).pop();
              },
              child: const Text(
                'All',
              ),
            ),
            TextButton(
              onPressed: () {
                ref.read(selectedFilterProvider.notifier).state = 'Today';
                Navigator.of(context).pop();
              },
              child: Text(
                'Today',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: selectedFilter == 'Today'
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                    ),
              ),
            ),
            TextButton(
              onPressed: () {
                ref.read(selectedFilterProvider.notifier).state = 'Yesterday';
                Navigator.of(context).pop();
              },
              child: Text(
                'Yesterday',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: selectedFilter == 'Yesterday'
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                    ),
              ),
            ),
            TextButton(
              onPressed: () {
                ref.read(selectedFilterProvider.notifier).state = 'This Year';
                Navigator.of(context).pop();
              },
              child: Text(
                'This Year',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: selectedFilter == 'This Year'
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
