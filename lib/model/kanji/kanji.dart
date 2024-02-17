import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';

@immutable
class Kanji {
  final Jlpt? jlpt;
  final int? grade;
  final int? frequency;
  final String kanjiValue;
  final List<String> kunyomi;
  final List<String> onyomi;
  final List<String> meanings;
  final KnowledgeLevel? knowledgeLevel;

  const Kanji({
    required this.kanjiValue,
    required this.kunyomi,
    required this.onyomi,
    required this.meanings,
    required this.grade,
    required this.frequency,
    required this.knowledgeLevel,
    required this.jlpt,
  });
}
