import 'package:flutter/material.dart';

class EmojiCardData {
  final String title; //название эмодзи
  final String subtitle; //текст эмодзи
  final String? imageURL; //картинка
  final String? soundUrl; // звук (новое поле)

  EmojiCardData(this.title, {required this.subtitle, this.imageURL, this.soundUrl});
}
