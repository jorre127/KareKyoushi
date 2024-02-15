import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/viewmodel/kanji_list/kanji_list_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/general/kanji/jlpt_label.dart';
import 'package:kare_kyoushi/widget/kanji_list/kanji_grid.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class KanjiListScreen extends StatefulWidget {
  final Jlpt jlpt;

  const KanjiListScreen({
    required this.jlpt,
    super.key,
  });

  @override
  KanjiListScreenState createState() => KanjiListScreenState();
}

class KanjiListScreenState extends State<KanjiListScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<KanjiListViewModel>(
      create: () => getIt()..init(widget.jlpt),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen.child(
        showHeader: true,
        padding: EdgeInsets.zero,
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JlptLabel(jlptLevel: viewModel.jlpt),
            const SizedBox(width: 8),
            Text(
              localization.getTranslation(viewModel.jlpt.difficultyKey),
              style: theme.textThemes.coreTextTheme.titleHeader,
            ),
          ],
        ),
        child: KanjiGrid(
          kanji: viewModel.kanji,
          onKanjiTapped: viewModel.onKanjiTapped,
        ),
      ),
    );
  }
}
