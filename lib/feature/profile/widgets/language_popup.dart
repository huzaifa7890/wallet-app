import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walletapp/core/language_repo.dart';
import 'package:walletapp/core/language.dart';

class LanguagePopUpMenu extends ConsumerWidget {
  const LanguagePopUpMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);
    return PopupMenuButton(
      onSelected: (value) =>
          ref.read(languageRepositoryProvider).setLanguage(value),
      itemBuilder: (context) => [
        for (var value in Language.values)
          PopupMenuItem(
            value: value,
            child: Row(
              children: [
                Text(value.name),
              ],
            ),
          ),
      ],
      child: Text('Language ${language.name}'),
    );
  }
}
