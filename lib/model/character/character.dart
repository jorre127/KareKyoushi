import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';

@immutable
class Character {
  final DifficultyGrade difficultyGrade;
  final Alphabet alphbabet;
  final int? grade;
  final int? frequency;
  final String value;
  final List<String> kunyomi;
  final List<String> onyomi;
  final List<String> meanings;
  final KnowledgeLevel? knowledgeLevel;

  const Character({
    required this.alphbabet,
    required this.value,
    required this.kunyomi,
    required this.onyomi,
    required this.meanings,
    required this.grade,
    required this.frequency,
    required this.knowledgeLevel,
    required this.difficultyGrade,
  });
}
