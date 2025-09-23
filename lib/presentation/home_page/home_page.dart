import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../details_page/details_page.dart';
import '../../domain/models/card.dart';

part 'card.dart';

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
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: const WidgetBody(),
    );
  }
}

class WidgetBody extends StatelessWidget {
  const WidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      EmojiCardData(
        "Happy King",
        subtitle: "HE HE HE HA!",
        imageURL:
            'https://media.tenor.com/R_M90toyOCkAAAAm/hehe-haha-clash-royale.webp',
        soundUrl:
            "sounds/clash_royale_happy_king.mp3",
      ),
      EmojiCardData(
        "Sad King",
        subtitle: "UHU HU HUUU",
        imageURL: 'https://media.tenor.com/v4_ZA58fgQsAAAAM/la-mul%C8%9Bi.gif',
        soundUrl:
            'sounds/clash_royale_sad_king.mp3',
      ),
      EmojiCardData(
        "Angry King",
        subtitle: "GHRRrrr!!!",
        imageURL:
            'https://media.tenor.com/AgBwE08FsoMAAAAm/heheheha-clashroyal.webp',
        soundUrl:
            'sounds/clash_royale_angry_king.ogg',

      ),
      EmojiCardData(
        "Chicken",
        subtitle: "Сock-a-doodle-doo!",
        imageURL: 'https://media.tenor.com/zPQD_2prkrUAAAAm/clash-royale.webp',
        soundUrl: '',
      ),
      EmojiCardData(
        "Troll Goblin",
        subtitle: "MiMiMiMiMi",
        imageURL:
            'https://media.tenor.com/29RZgiyx0fsAAAAm/clash-royale-boohoo.webp',
        soundUrl:
            'sounds/clash_royale_goblin_memememe.wav',
      ),
      EmojiCardData(
        "Princess",
        subtitle: "Phew Phew Phew Phew",
        imageURL:
            'https://static.wikia.nocookie.net/clashroyale/images/6/63/Whistling_Princess.png/revision/latest?cb=20230919124919',
        soundUrl: 'sounds/clash_royalу_princess_whistle.wav',
      ),
      EmojiCardData(
        "Firecracker",
        subtitle: "She's not talking. She activates the King's Tower",
        imageURL:
            'https://static.wikia.nocookie.net/clashroyale/images/2/2b/Firecracker_Heart.png/revision/latest?cb=20210724052228',
        soundUrl: 'sounds/clash_royale_firecracker.mp3',
      ),
      EmojiCardData(
        "E-WZ",
        subtitle: "UHA-HaHaHa-HaHa-HaHa-HaAaAa",
        imageURL:
        'https://images.voicy.network/Content/Clips/Images/d75b40ed-9e36-49d2-a75f-d51759c73244-small.jpeg',
        soundUrl: 'sounds/clash_royale_electro_wz.mp3',
      ),
    ];

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: data
                .map(
                  (data) => _Card.fromData(
                    data,
                    onLike: (title, isLiked) =>
                        _showSnackBar(context, title, isLiked),
                    onTap: () => _navToDetails(context, data),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  void _navToDetails(BuildContext context, EmojiCardData data) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => DetailsPage(data)),
    );
  }

  void _showSnackBar(BuildContext context, String title, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${isLiked ? 'Неприятный' : 'Фулл контра'} $title ${isLiked ? 'попался' : 'заснайпил'}',
            style: TextStyle(fontFamily: 'ClashRoyaleRegular', fontSize: 24),
          ),
          backgroundColor: Colors.blueAccent,
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }
}
