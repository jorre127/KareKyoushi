import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/animation/appear_disappear_switcher.dart';
import 'package:kare_kyoushi/widget/character_detail/character_detail_words_containing_item_body.dart';
import 'package:kare_kyoushi/widget/character_detail/character_detail_words_containing_item_header.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterDetailListWordsContainingItem extends StatefulWidget {
  final Word word;
  final bool isLast;

  const CharacterDetailListWordsContainingItem({
    required this.word,
    required this.isLast,
    super.key,
  });

  @override
  State<CharacterDetailListWordsContainingItem> createState() => _CharacterDetailListWordsContainingItemState();
}

class _CharacterDetailListWordsContainingItemState extends State<CharacterDetailListWordsContainingItem> {
  bool _isExpanded = false;

  void _toggleExpanded() => setState(() {
        _isExpanded = !_isExpanded;
      });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        padding: widget.isLast ? const EdgeInsets.only(bottom: 12) : null,
        decoration: BoxDecoration(
          color: theme.colorsTheme.bgCard,
          borderRadius: widget.isLast
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(ThemeDimens.largeCardBorderRadiusValue),
                  bottomRight: Radius.circular(ThemeDimens.largeCardBorderRadiusValue),
                )
              : null,
        ),
        child: Column(
          children: [
            CharacterDetailListWordsContainingItemHeader(
              word: widget.word,
              onExpandTapped: _toggleExpanded,
              isExpanded: _isExpanded,
            ),
            AppearDisappearSwitcher(
              isVisible: _isExpanded,
              child: CharacterDetailListWordsContainingItemBody(word: widget.word),
            ),
          ],
        ),
      ),
    );
  }
}
