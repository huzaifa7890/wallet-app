import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walletapp/models/card.dart';
import 'package:walletapp/provider/card_provider.dart';

class CardDialogue extends ConsumerStatefulWidget {
  const CardDialogue({Key? key}) : super(key: key);

  @override
  ConsumerState<CardDialogue> createState() => _CardDialogueState();
}

class _CardDialogueState extends ConsumerState<CardDialogue> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController cardNoController = TextEditingController();
    final TextEditingController expiryController = TextEditingController();
    final TextEditingController holderNameController = TextEditingController();
    final TextEditingController cvvController = TextEditingController();
    final TextEditingController bankNameController = TextEditingController();
    return AlertDialog(
      title: const Text('Add Card'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextFormField(
              controller: cardNoController,
              decoration: const InputDecoration(labelText: 'Card Number'),
            ),
            TextFormField(
              controller: expiryController,
              decoration: const InputDecoration(labelText: 'Expiry Date'),
            ),
            TextFormField(
              controller: holderNameController,
              decoration: const InputDecoration(labelText: 'Card Holder Name'),
            ),
            TextFormField(
              controller: cvvController,
              decoration: const InputDecoration(labelText: 'CVV Number'),
            ),
            TextFormField(
              controller: bankNameController,
              decoration: const InputDecoration(labelText: 'Bank Name'),
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return DropdownButton<CardType>(
                  onChanged: (CardType? newValue) {
                    if (newValue != null) {
                      ref.read(selectedCardTypeProvider.notifier).state =
                          newValue;
                    }
                  },
                  value: ref.watch(selectedCardTypeProvider),
                  items: CardType.values
                      .map<DropdownMenuItem<CardType>>((CardType value) {
                    return DropdownMenuItem<CardType>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        TextButton(
          onPressed: () {
            final newCard = CardModel(
              cardNo: cardNoController.text,
              cardExpiry: expiryController.text,
              cardHolderName: holderNameController.text,
              cvvNo: cvvController.text,
              bankName: bankNameController.text,
              cardType: ref.read(selectedCardTypeProvider),
            );
            ref.read(cardProvider.notifier).addCard(newCard);

            Navigator.of(context).pop();
          },
          child: Text(
            'Add',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
