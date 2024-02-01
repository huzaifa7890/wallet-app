import 'package:isar/isar.dart';
part 'transaction.g.dart';

@Collection()
class Transaction {
  Id id = Isar.autoIncrement;
  final String name;
  final DateTime dateTime;
  final int income;
  final int spending;
  final String imagePath;

  Transaction({
    required this.name,
    required this.dateTime,
    required this.income,
    required this.spending,
    required this.imagePath,
  });
}
