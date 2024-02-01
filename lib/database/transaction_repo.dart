import 'package:isar/isar.dart';
import 'package:walletapp/models/transaction.dart';

class TransactionRepository {
  final Isar _isar;

  TransactionRepository(this._isar);

  Future<void> addTransaction(Transaction transaction) async {
    await _isar.writeTxn(() => _isar.transactions.put(transaction));
  }

  Future<List<Transaction>> fetchTransactions() async {
    return await _isar.transactions.where().findAll();
  }

  Future<void> updateTransaction(Transaction transaction) async {
    await _isar.writeTxn(() => _isar.transactions.put(transaction));
  }

  Future<void> deleteTransaction(Transaction transaction) async {
    await _isar.writeTxn(() => _isar.transactions.delete(transaction.id));
  }
}
