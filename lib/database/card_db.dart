import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walletapp/database/card_repo.dart';
import 'package:walletapp/models/card.dart';

class CardNotifier extends StateNotifier<List<CardModel>> {
  CardNotifier(this._cardrepository) : super([]);
  final CardRepository _cardrepository;

  Future<void> addCard(CardModel card) async {
    await _cardrepository.addCard(card);
    state = [...state, card];
  }

  Future<void> fetchCard() async {
    final cards = await _cardrepository.fetchCard();
    state = cards;
  }

  Future<void> updateCard(CardModel card) async {
    await _cardrepository.updateCard(card);
    state = [
      for (final car in state)
        if (car.id == card.id) card else car
    ];
  }

  Future<void> deleteCard(CardModel card) async {
    await _cardrepository.deleteCard(card);
    state = state.where((car) => car.id != card.id).toList();
  }
}
