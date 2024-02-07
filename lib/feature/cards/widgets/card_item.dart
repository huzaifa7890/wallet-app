import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:walletapp/models/card.dart';

class CardItem extends StatelessWidget {
  final CardModel card;
  const CardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return CreditCard(
      cardNumber: card.cardNo,
      cardExpiry: card.cardExpiry,
      cardHolderName: card.cardHolderName,
      cvv: card.cvvNo,
      bankName: card.bankName,
      // cardType: card.CardType.masterCard,
      showBackSide: false,
      frontBackground: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      backBackground: CardBackgrounds.white,
      showShadow: true,
      textExpDate: 'Exp. Date',
      textName: 'Name',
      textExpiry: 'MM/YY',
    );
  }
}
