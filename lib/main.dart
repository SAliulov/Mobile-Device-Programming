import 'package:flutter/material.dart';

import 'presentation/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontFamily: 'ClashRoyaleBold'),
        ),
      ),
      home: const MyHomePage(title: 'Эмодзи из игры Clash Royale'),
    );
  }
}