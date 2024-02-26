import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walletapp/core/isar.dart';
import 'package:walletapp/database/transaction_db.dart';
import 'package:walletapp/database/transaction_repo.dart';
import 'package:walletapp/models/transaction.dart';

final transactionsProvider =
    StateNotifierProvider<TransactionsNotifier, List<Transaction>>((ref) {
  final isar = ref.watch(isarProvider);
  final transactionRepository = TransactionRepository(isar);
  return TransactionsNotifier(transactionRepository);
});

final selectedBankNameProvider = StateProvider<String>((ref) => 'Select Bank');

final selectedFilterProvider = StateProvider<String>((ref) => 'All');

final filteredTransactionsProvider =
    NotifierProvider<FilteredTransactionsNotifier, List<Transaction>>(
        () => FilteredTransactionsNotifier());

class FilteredTransactionsNotifier extends Notifier<List<Transaction>> {
  FilteredTransactionsNotifier() : super();

  Map<String, List<Transaction>> filterAndGroupTransactions() {
    final transactions = ref.read(transactionsProvider);
    final filter = ref.read(selectedFilterProvider);

    final filteredTransactions = filterTransactions(transactions, filter);
    filteredTransactions.sort((a, b) => b.dateTime.compareTo(a.dateTime));

    final dateViseTransactions = <String, List<Transaction>>{};
    for (var transaction in filteredTransactions) {
      final date = transaction.dateTime.toLocal().toString().split(' ')[0];
      if (!dateViseTransactions.containsKey(date)) {
        dateViseTransactions[date] = [];
      }
      dateViseTransactions[date]!.add(transaction);
    }

    return dateViseTransactions;
  }

  List<Transaction> filterTransactions(
      List<Transaction> transactions, String filter) {
    if (filter == 'Today') {
      return transactions
          .where((transaction) => isToday(transaction.dateTime))
          .toList();
    } else if (filter == 'Yesterday') {
      return transactions
          .where((transaction) => isYesterday(transaction.dateTime))
          .toList();
    } else if (filter == 'This Year') {
      return transactions
          .where((transaction) => isThisYear(transaction.dateTime))
          .toList();
    } else if (filter == 'All') {
      return transactions;
    } else {
      state = transactions;
      return transactions;
    }
  }

  bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.day == now.day &&
        date.month == now.month &&
        date.year == now.year;
  }

  bool isYesterday(DateTime date) {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    return date.day == yesterday.day &&
        date.month == yesterday.month &&
        date.year == yesterday.year;
  }

  bool isThisYear(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year;
  }

  @override
  List<Transaction> build() {
    return [];
  }
}
