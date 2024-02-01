import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:walletapp/core/theme_data.dart';
import 'package:walletapp/feature/profile/widgets/language_popup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends ConsumerStatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late ImagePicker _imagePicker;
  File? _pickedImage;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        actions: const [
          LanguagePopUpMenu(),
        ],
        title: Text(
          'Profile',
          style: theme.textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                child: _pickedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.file(_pickedImage!),
                      )
                    : const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Huzaifa',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'huzaifa@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Card(
              color: theme.colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.theme,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Switch(
                      value: themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        ref.read(themeModeProvider.notifier).state =
                            value ? ThemeMode.dark : ThemeMode.light;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
