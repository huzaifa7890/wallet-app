import 'package:isar/isar.dart';
part 'card.g.dart';

@Collection()
class CardModel {
  Id id = Isar.autoIncrement;
  final String cardNo;
  final String cardExpiry;
  final String cardHolderName;
  final String cvvNo;
  final String bankName;

  @enumerated
  final CardType cardType;

  CardModel({
    required this.cardNo,
    required this.cardExpiry,
    required this.cardHolderName,
    required this.cvvNo,
    required this.bankName,
    required this.cardType,
  });
}

enum CardType { masterCard, visa, other }
