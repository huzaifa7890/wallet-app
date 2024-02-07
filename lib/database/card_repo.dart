import 'package:isar/isar.dart';
import 'package:walletapp/models/card.dart';

class CardRepository {
  final Isar _isar;
  CardRepository(this._isar);

  Future<void> addCard(CardModel card) async {
    await _isar.writeTxn(() => _isar.cardModels.put(card));
  }

  Future<List<CardModel>> fetchCard() async {
    return await _isar.cardModels.where().findAll();
  }

  Future<void> updateCard(CardModel card) async {
    await _isar.writeTxn(() => _isar.cardModels.put(card));
  }

  Future<void> deleteCard(CardModel card) async {
    await _isar.writeTxn(() => _isar.cardModels.delete(card.id));
  }
}
