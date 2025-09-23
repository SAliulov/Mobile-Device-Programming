import 'package:flutter/material.dart';

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
          titleTextStyle: TextStyle(
            fontFamily: 'ClashRoyaleBold',
          ),
        ),
      ),
      home: const MyHomePage(title: 'Эмодзи из игры Clash Royale'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color _color = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: MyWidget(),
    );
  }
}

class _EmojiCardData {
  final String title; //название эмодзи
  final String subtitle; //текст эмодзи
  final String? imageURL; //картинка

  _EmojiCardData(this.title, {required this.subtitle, this.imageURL});
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      _EmojiCardData(
        "Happy King",
        subtitle: "HE HE HE HA!",
        imageURL:
            'https://media.tenor.com/R_M90toyOCkAAAAm/hehe-haha-clash-royale.webp',
      ),
      _EmojiCardData(
        "Sad King",
        subtitle: "UHU HU HUUU",
        imageURL: 'https://media.tenor.com/v4_ZA58fgQsAAAAM/la-mul%C8%9Bi.gif',
      ),
      _EmojiCardData(
        "Angry King",
        subtitle: "GHRRrrr!!!",
        imageURL:
            'https://media.tenor.com/AgBwE08FsoMAAAAm/heheheha-clashroyal.webp',
      ),
      _EmojiCardData(
        "Chicken",
        subtitle: "Сock-a-doodle-doo!",
        imageURL: 'https://media.tenor.com/zPQD_2prkrUAAAAm/clash-royale.webp',
      ),
      _EmojiCardData(
        "Troll Goblin",
        subtitle: "MiMiMiMiMi",
        imageURL:
            'https://media.tenor.com/29RZgiyx0fsAAAAm/clash-royale-boohoo.webp',
      ),
      _EmojiCardData(
        "Princess",
        subtitle: "Phew Phew Phew Phew",
        imageURL:
            'https://static.wikia.nocookie.net/clashroyale/images/6/63/Whistling_Princess.png/revision/latest?cb=20230919124919',
      ),
      _EmojiCardData(
        "Firecracker",
        subtitle: "She's not talking. She activates the King's Tower",
        imageURL:
            'https://static.wikia.nocookie.net/clashroyale/images/2/2b/Firecracker_Heart.png/revision/latest?cb=20210724052228',
      ),
    ];

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: data.map((e) => _Card.fromData(e)).toList(),
          ),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;

  const _Card(this.title, {required this.subtitle, this.imageUrl});

  factory _Card.fromData(_EmojiCardData data) =>
      _Card(data.title, subtitle: data.subtitle, imageUrl: data.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 4,
            offset: const Offset(0, 5),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 150,
              width: 140,
              child: Image.network(
                imageUrl ?? '',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Placeholder(),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'ClashRoyaleBold',
                      color: Colors.black,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'ClashRoyaleRegular',
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
