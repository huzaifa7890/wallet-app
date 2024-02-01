import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walletapp/database/transaction_repo.dart';
import 'package:walletapp/models/transaction.dart';

class TransactionsNotifier extends StateNotifier<List<Transaction>> {
  TransactionsNotifier(this._transactionRepository) : super([]);
  final TransactionRepository _transactionRepository;

  Future<void> addTransaction(Transaction transaction) async {
    await _transactionRepository.addTransaction(transaction);
    state = [...state, transaction];
  }

  Future<void> fetchTransactions() async {
    final transactions = await _transactionRepository.fetchTransactions();
    state = transactions;
  }

  Future<void> updateTransaction(Transaction transaction) async {
    await _transactionRepository.updateTransaction(transaction);
    state = [
      for (final trans in state)
        if (trans.id == transaction.id) transaction else trans
    ];
  }

  Future<void> deleteTransaction(Transaction transaction) async {
    await _transactionRepository.deleteTransaction(transaction);
    state = state.where((trans) => trans.id != transaction.id).toList();
  }
}
