import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../../l10n/app_localizations.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              l10n.theme,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          RadioListTile<ThemeMode>(
            title: Text(l10n.lightTheme),
            value: ThemeMode.light,
            groupValue: themeMode,
            onChanged: (val) {
              if (val != null)
                ref.read(themeModeProvider.notifier).setTheme(ThemeMode.light);
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text(l10n.darkTheme),
            value: ThemeMode.dark,
            groupValue: themeMode,
            onChanged: (val) {
              if (val != null)
                ref.read(themeModeProvider.notifier).setTheme(ThemeMode.dark);
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text(l10n.systemDefault),
            value: ThemeMode.system,
            groupValue: themeMode,
            onChanged: (val) {
              if (val != null)
                ref.read(themeModeProvider.notifier).setTheme(ThemeMode.system);
            },
          ),
        ],
      ),
    );
  }
}
