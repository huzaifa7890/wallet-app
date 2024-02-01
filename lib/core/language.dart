import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Language {
  english(name: 'English', code: 'en'),
  arabic(name: 'Arabic', code: 'ar');

  const Language({required this.name, required this.code});

  final String name;
  final String code;
}

final languageProvider = StateProvider<Language>((ref) => Language.english);
