import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/viewmodel/kanji_grade_list/kanji_grade_list_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/kanji_grade/kanji_grade_list_item.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class KanjiGradeListScreen extends StatefulWidget {
  const KanjiGradeListScreen({super.key});

  @override
  KanjiGradeListScreenState createState() => KanjiGradeListScreenState();
}

class KanjiGradeListScreenState extends State<KanjiGradeListScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<KanjiGradeListViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen(
        title: localization.kanjiGradeListScreenTitle,
        showHeader: true,
        children: Jlpt.values
            .map(
              (jlptLevel) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: KanjiGradeListItem(jlptLevel: jlptLevel),
              ),
            )
            .toList(),
      ),
    );
  }
}
