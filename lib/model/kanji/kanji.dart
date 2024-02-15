import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';

@immutable
class Kanji {
  final Jlpt? jlpt;
  final String kanjiValue;

  const Kanji({
    required this.kanjiValue,
    this.jlpt,
  });
}
