import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/widget/character_detail/character_detail_words_containing_item.dart';

class CharacterDetailWordsContaining extends StatelessWidget {
  final List<Word> words;

  const CharacterDetailWordsContaining({
    required this.words,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SliverList.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return CharacterDetailListWordsContainingItem(word: word);
        },
      );
}
