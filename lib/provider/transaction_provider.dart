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
