import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walletapp/provider/transaction_provider.dart';

class TransactionFilter extends ConsumerWidget {
  const TransactionFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(selectedFilterProvider);
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Filter Options",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  ref.read(selectedFilterProvider.notifier).state = 'All';
                  Navigator.of(context).pop();
                },
                child: Text(
                  'All',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: selectedFilter == 'All'
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                      ),
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
        ],
      ),
    );
  }
}
