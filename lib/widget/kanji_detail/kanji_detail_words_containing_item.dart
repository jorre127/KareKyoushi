import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/widget/animation/appear_disappear_switcher.dart';
import 'package:kare_kyoushi/widget/kanji_detail/kanji_detail_words_containing_item_body.dart';
import 'package:kare_kyoushi/widget/kanji_detail/kanji_detail_words_containing_item_header.dart';

class KanjiDetailListWordsContainingItem extends StatefulWidget {
  final Word word;

  const KanjiDetailListWordsContainingItem({
    required this.word,
    super.key,
  });

  @override
  State<KanjiDetailListWordsContainingItem> createState() => _KanjiDetailListWordsContainingItemState();
}

class _KanjiDetailListWordsContainingItemState extends State<KanjiDetailListWordsContainingItem> {
  bool _isExpanded = false;

  void _toggleExpanded() => setState(() {
        _isExpanded = !_isExpanded;
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KanjiDetailListWordsContainingItemHeader(
          word: widget.word,
          onExpandTapped: _toggleExpanded,
          isExpanded: _isExpanded,
        ),
        AppearDisappearSwitcher(
          isVisible: _isExpanded,
          child: KanjiDetailListWordsContainingItemBody(word: widget.word),
        ),
      ],
    );
  }
}
