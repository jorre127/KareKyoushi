import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/util/extension/kanji_extension.dart';
import 'package:kare_kyoushi/widget/general/card/kare_kyoushi_card.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiGridItem extends StatefulWidget {
  final Kanji kanji;
  final VoidCallback? onTapped;

  const KanjiGridItem({
    required this.kanji,
    this.onTapped,
    super.key,
  });

  @override
  State<KanjiGridItem> createState() => _KanjiGridItemState();
}

class _KanjiGridItemState extends State<KanjiGridItem> {
  final LayerLink layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => KKCard(
        padding: const EdgeInsets.all(16),
        onTapped: widget.onTapped,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CompositedTransformTarget(
                link: layerLink,
                child: Text(
                  widget.kanji.kanjiValue,
                  style: theme.textThemes.coreTextTheme.copyBig.copyWith(height: 1),
                ),
              ),
              CompositedTransformFollower(
                link: layerLink,
                followerAnchor: Alignment.bottomCenter,
                targetAnchor: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    widget.kanji.reading ?? '',
                    style: theme.textThemes.xtraSubtleTextTheme.copySubtle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
