import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/viewmodel/kanji_detail/kanji_detail_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/general/slivers/sliver_sized_box.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_divider.dart';
import 'package:kare_kyoushi/widget/kanji_detail/kanji_detail_header.dart';
import 'package:kare_kyoushi/widget/kanji_detail/kanji_detail_words_containing.dart';
import 'package:kare_kyoushi/widget/kanji_detail/kanji_detail_words_containing_title.dart';
import 'package:kare_kyoushi/widget/kanji_detail/kanji_meanings.dart';
import 'package:kare_kyoushi/widget/kanji_detail/kanji_readings.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@FlutterRoute(isFullscreenDialog: true)
class KanjiDetailScreen extends StatefulWidget {
  final Kanji kanji;

  const KanjiDetailScreen({
    required this.kanji,
    super.key,
  });

  @override
  KanjiDetailScreenState createState() => KanjiDetailScreenState();
}

class KanjiDetailScreenState extends State<KanjiDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<KanjiDetailViewModel>(
      create: () => getIt()..init(widget.kanji),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen.child(
        showHeader: false,
        padding: EdgeInsets.zero,
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorsTheme.bgCard,
            borderRadius: ThemeDimens.largeCardBorderRadius,
          ),
          child: Column(
            children: [
              KanjiDetailHeader(
                jlptLevel: viewModel.kanji.jlpt ?? Jlpt.n5,
                onCloseTapped: viewModel.onCloseTapped,
                kanji: viewModel.kanji,
              ),
              const KKDivider(),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KanjiMeanings(kanjiMeanings: viewModel.kanji.meanings),
                            const SizedBox(height: 24),
                            KanjiReadings(kanji: viewModel.kanji),
                          ],
                        ),
                      ),
                    ),
                    const SliverSizedBox(height: 4),
                    KanjiDetailWordsContainingTitle(kanji: viewModel.kanji),
                    KanjiDetailWordsContaining(words: viewModel.wordsContaining),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
