import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walletapp/core/language.dart';

class LanguageRepository {
  LanguageRepository({required this.ref});
  final Ref ref;

  static const String languaCodeKey = "language_code";

  Future<void> setLanguage(Language language) async {
    final pref = await ref.read(sharedPreferenceProvider.future);
    await pref.setString(languaCodeKey, language.code);
    ref.read(languageProvider.notifier).update((_) => language);
  }

  Future<Language> getLanguage() async {
    final pref = await ref.read(sharedPreferenceProvider.future);
    final code = pref.getString(languaCodeKey);
    for (var value in Language.values) {
      if (value.code == code) return value;
    }
    return Language.english;
  }
}

final sharedPreferenceProvider =
    FutureProvider((ref) => SharedPreferences.getInstance());
final languageRepositoryProvider =
    Provider<LanguageRepository>((ref) => LanguageRepository(ref: ref));
