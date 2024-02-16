import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';

@lazySingleton
class JlptMatcher {
  static const _assetPath = 'assets/jlpt_levels/';
  final _jlptMap = <Jlpt, List<String>>{};

  Future<Jlpt?> getLevelForWord(String word) async {
    if (_jlptMap.isEmpty) {
      for (final level in Jlpt.values) {
        final words = await rootBundle.loadString('${_assetPath}n${level.rank}.txt');
        _jlptMap[level] = LineSplitter.split(words).toList();
      }
    }
    for (final level in _jlptMap.keys) {
      if (_jlptMap[level]?.contains(word) ?? false) return level;
    }
    return null;
  }
}
