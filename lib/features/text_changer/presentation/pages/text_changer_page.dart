import 'package:flutter/material.dart';

class TextChangerPage extends StatefulWidget {
  const TextChangerPage({super.key, required this.title});

  final String title;

  @override
  State<TextChangerPage> createState() => _TextChangerPageState();
}

class _TextChangerPageState extends State<TextChangerPage> {
  String _displayText = 'Text will appear here';

  void _updateText(String newText) {
    setState(() {
      _displayText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: _updateText,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Text',
                hintText: 'What you type will appear below',
              ),
            ),
            const SizedBox(height: 24),
            Text(
              _displayText.isEmpty ? 'Text will appear here' : _displayText,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
