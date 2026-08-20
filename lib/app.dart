import 'package:flutter/material.dart';
import 'features/text_changer/presentation/pages/text_changer_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Text Changer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TextChangerPage(title: 'Dynamic Text Changer'),
    );
  }
}
