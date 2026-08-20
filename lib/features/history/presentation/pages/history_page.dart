import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_text_changer/features/text_changer/presentation/providers/text_changer_provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              context.read<TextChangerProvider>().clearHistory();
            },
            tooltip: 'Clear All',
          ),
        ],
      ),
      body: Consumer<TextChangerProvider>(
        builder: (context, provider, child) {
          if (provider.history.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No history yet', style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: provider.history.length,
            itemBuilder: (context, index) {
              final text = provider.history[index];
              return Card(
                child: ListTile(
                  title: Text(text),
                  trailing: IconButton(
                    icon: const Icon(Icons.restore),
                    onPressed: () {
                      provider.restoreFromHistory(text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Text restored!')),
                      );
                    },
                    tooltip: 'Restore',
                  ),
                  onLongPress: () {
                    provider.removeFromHistory(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
