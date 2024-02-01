import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:walletapp/models/transaction.dart';

final isarProvider = Provider<Isar>((_) => throw UnimplementedError());

Future<Isar> isarInitialize() async {
  final dir = await getTemporaryDirectory();
  final isar = await Isar.open(
    [TransactionSchema],
    directory: dir.path,
  );
  return isar;
}
