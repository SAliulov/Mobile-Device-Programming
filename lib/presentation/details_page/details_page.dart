import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../domain/models/card.dart';

class DetailsPage extends StatefulWidget {
  final EmojiCardData data;

  const DetailsPage(this.data, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playSound();
  }

  Future<void> _playSound() async {
    final source = widget.data.soundUrl;
    if (source != null && source.isNotEmpty) {
      try {
        if (source.startsWith('http')) {
          await _player.play(UrlSource(source)); // Для URL
        } else {
          await _player.play(AssetSource(source)); // Для локальных путей
        }
      } catch (e) {
        print('Ошибка звука: $e');
      }
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D47A1), // Тёмно-синий
              Color(0xFFD3D3D3), // Серо-белый
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  widget.data.title,
                  style: const TextStyle(
                    fontFamily: 'ClashRoyaleBold',
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.data.imageURL != null &&
                          widget.data.imageURL!.isNotEmpty)
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.4),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                widget.data.imageURL!,
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Placeholder(
                                  color: Colors.grey,
                                  fallbackHeight: 300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      // Заголовок с шрифтом Clash Royale
                      Text(
                        widget.data.title,
                        style: const TextStyle(
                          fontFamily: 'ClashRoyaleBold',
                          color: Colors.white,
                          fontSize: 34,
                          // Большой заголовок
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Подзаголовок с шрифтом Clash Royale
                      Text(
                        widget.data.subtitle,
                        style: const TextStyle(
                          fontFamily: 'ClashRoyaleRegular',
                          color: Colors.white70,
                          fontSize: 22,
                          height: 1.3,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
