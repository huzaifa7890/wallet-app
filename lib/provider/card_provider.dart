import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walletapp/core/isar.dart';
import 'package:walletapp/database/card_db.dart';
import 'package:walletapp/database/card_repo.dart';
import 'package:walletapp/models/card.dart';

final cardProvider =
    StateNotifierProvider<CardNotifier, List<CardModel>>((ref) {
  final isar = ref.watch(isarProvider);
  final cardRepository = CardRepository(isar);
  return CardNotifier(cardRepository);
});

final selectedCardTypeProvider = StateProvider<CardType>((ref) {
  return CardType.masterCard;
});
