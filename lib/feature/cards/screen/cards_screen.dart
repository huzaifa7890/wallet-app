import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:walletapp/feature/cards/widgets/card_dialogue.dart';
import 'package:walletapp/feature/cards/widgets/card_item.dart';
import 'package:walletapp/models/card.dart';
import 'package:walletapp/provider/card_provider.dart';

class CardScreen extends ConsumerStatefulWidget {
  const CardScreen({super.key});

  @override
  ConsumerState<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends ConsumerState<CardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cardProvider.notifier).fetchCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<CardModel> cards = ref.watch(cardProvider);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      context.push('/card-details/${cards[index].id}');
                    },
                    child: CardItem(
                      card: cards[index],
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CardDialogue();
                },
              );
            },
            child: Text(
              'Add Card',
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
