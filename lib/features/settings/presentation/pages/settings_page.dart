import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';
import '../../text_changer/presentation/providers/text_changer_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Toggle app theme'),
            secondary: const Icon(Icons.dark_mode),
            value: context.watch<SettingsProvider>().isDarkMode,
            onChanged: (value) {
              context.read<SettingsProvider>().toggleTheme();
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Clear History'),
            subtitle: const Text('Remove all saved texts'),
            leading: const Icon(Icons.delete_forever),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Clear History'),
                  content: const Text('Are you sure you want to clear all history?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<TextChangerProvider>().clearHistory();
                        Navigator.pop(context);
                      },
                      child: const Text('Clear'),
                    ),
                  ],
                ),
              );
            },
          ),
          const Divider(),
          const AboutListTile(
            icon: Icon(Icons.info),
            applicationName: 'Dynamic Text Changer',
            applicationVersion: '1.0.0',
            applicationLegalese: '© 2026 Magen',
            child: Text('About App'),
          ),
        ],
      ),
    );
  }
}
