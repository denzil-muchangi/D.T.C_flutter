import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_text_changer/features/text_changer/presentation/providers/text_changer_provider.dart';

class TextChangerPage extends StatefulWidget {
  const TextChangerPage({super.key, required this.title});

  final String title;

  @override
  State<TextChangerPage> createState() => _TextChangerPageState();
}

class _TextChangerPageState extends State<TextChangerPage> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy),
            onPressed: () {
              final text = context.read<TextChangerProvider>().currentText;
              if (text.isNotEmpty) {
                Clipboard.setData(ClipboardData(text: text));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copied to clipboard!')),
                );
              }
            },
            tooltip: 'Copy',
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              context.read<TextChangerProvider>().saveToHistory();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Saved to history!')),
              );
            },
            tooltip: 'Save',
          ),
        ],
      ),
      body: Consumer<TextChangerProvider>(
        builder: (context, provider, child) {
          if (_textController.text != provider.currentText) {
            _textController.text = provider.currentText;
          }
          
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _textController,
                          onChanged: provider.updateText,
                          maxLines: null,
                          decoration: const InputDecoration(
                            labelText: 'Enter Dynamic Text',
                            hintText: 'Type something amazing...',
                            prefixIcon: Icon(Icons.text_fields),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Live Preview',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    provider.currentText.isEmpty ? 'Your text will appear here' : provider.currentText,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => provider.updateText(''),
                  icon: const Icon(Icons.clear_all),
                  label: const Text('Clear Current Text'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
