import 'package:bank_application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../support/support_chat_screen.dart';
import '../faq/faq_screen.dart';
import '../settings/settings_screen.dart';
import '../../core/providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.profile)),
      body: ListView(
        children: [
          const SizedBox(height: 34),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.indigo,
            child: Icon(Icons.person, size: 48, color: Colors.white),
          ),
          const SizedBox(height: 18),
          Center(
            child: Text(
              'John Doe',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
          ),
          const Divider(height: 44),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: Text(l10n.supportChat),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => const SupportChatScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: Text(l10n.faq),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => const FAQScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(l10n.settings),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => const SettingsScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: Text(l10n.closeAccount),
            onTap: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(l10n.confirmAccountClosure),
                content: Text(l10n.sureCloseAccount),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(l10n.cancel),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      /* TODO: mock close */
                      Navigator.pop(context);
                    },
                    child: Text(l10n.closeAccountButton),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 44),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.language),
                label: Text(l10n.language),
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (_) => Consumer(
                    builder: (context, ref, __) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text("Қазақша"),
                          selected: locale == 'kk',
                          onTap: () {
                            ref.read(localeProvider.notifier).state = 'kk';
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("Русский"),
                          selected: locale == 'ru',
                          onTap: () {
                            ref.read(localeProvider.notifier).state = 'ru';
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("English"),
                          selected: locale == 'en',
                          onTap: () {
                            ref.read(localeProvider.notifier).state = 'en';
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton.icon(
                icon: const Icon(Icons.wb_sunny),
                label: Text(l10n.theme),
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (_) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(title: Text(l10n.lightTheme)),
                      ListTile(title: Text(l10n.darkTheme)),
                      ListTile(title: Text(l10n.systemDefault)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
