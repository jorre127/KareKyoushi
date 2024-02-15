import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';

@immutable
class Kanji {
  final Jlpt? jlpt;
  final int? grade;
  final int? frequency;
  final String kanjiValue;
  final List<String> kunyomi;
  final List<String> onyomi;
  final List<String> meanings;

  const Kanji({
    required this.kanjiValue,
    required this.kunyomi,
    required this.onyomi,
    required this.meanings,
    required this.grade,
    required this.frequency,
    this.jlpt,
  });
}
