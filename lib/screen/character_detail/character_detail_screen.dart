import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/character_detail/character_detail_buttons.dart';
import 'package:kare_kyoushi/widget/character_detail/character_detail_header.dart';
import 'package:kare_kyoushi/widget/character_detail/character_detail_words_containing.dart';
import 'package:kare_kyoushi/widget/character_detail/character_detail_words_containing_title.dart';
import 'package:kare_kyoushi/widget/character_detail/character_meanings.dart';
import 'package:kare_kyoushi/widget/character_detail/character_readings.dart';
import 'package:kare_kyoushi/widget/general/slivers/sliver_sized_box.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_divider.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_progress_indicator.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@FlutterRoute(isFullscreenDialog: true)
class CharacterDetailScreen extends StatefulWidget {
  final String character;

  const CharacterDetailScreen({
    required this.character,
    super.key,
  });

  @override
  CharacterDetailScreenState createState() => CharacterDetailScreenState();
}

class CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CharacterDetailViewModel>(
      create: () => getIt()..init(widget.character),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen.child(
        showHeader: false,
        padding: EdgeInsets.zero,
        child: Builder(
          builder: (context) {
            final character = viewModel.character;

            if (character == null) {
              return const Center(
                child: KKProgressIndicator.light(),
              );
            }

            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: theme.colorsTheme.bgCard,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ThemeDimens.largeCardBorderRadiusValue),
                            topRight: Radius.circular(ThemeDimens.largeCardBorderRadiusValue),
                          ),
                        ),
                        child: Column(
                          children: [
                            CharacterDetailHeader(
                              difficultyGrade: character.difficultyGrade ?? DifficultyGrade.n5,
                              onCloseTapped: viewModel.onCloseTapped,
                              character: character,
                            ),
                            const KKDivider(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: CustomScrollView(
                          physics: const ClampingScrollPhysics(),
                          slivers: [
                            SliverToBoxAdapter(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.colorsTheme.bgCard,
                                  borderRadius: viewModel.isKanji
                                      ? null
                                      : BorderRadius.only(
                                          bottomLeft: Radius.circular(ThemeDimens.largeCardBorderRadiusValue),
                                          bottomRight: Radius.circular(ThemeDimens.largeCardBorderRadiusValue),
                                        ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (viewModel.isKanji) ...[
                                        CharacterMeanings(characterMeanings: character.meanings),
                                        const SizedBox(height: 24),
                                      ],
                                      CharacterReadings(
                                        character: character,
                                        isKanji: viewModel.isKanji,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (viewModel.isKanji) ...[
                              CharacterDetailWordsContainingTitle(character: character),
                              CharacterDetailWordsContaining(words: viewModel.wordsContaining),
                              const SliverSizedBox(height: 100),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: CharacterDetailButtons(
                      onMehTapped: viewModel.onMehTapped,
                      onGotItTapped: viewModel.onGotItTapped,
                      character: character,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
