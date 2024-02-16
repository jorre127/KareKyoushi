import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/widget/kanji_detail/kanji_detail_words_containing_item.dart';

class KanjiDetailWordsContaining extends StatelessWidget {
  final List<Word> words;

  const KanjiDetailWordsContaining({
    required this.words,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SliverList.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return KanjiDetailListWordsContainingItem(word: word);
        },
      );
}
