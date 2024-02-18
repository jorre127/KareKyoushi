import 'package:flutter/material.dart';
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart';
import 'package:kare_kyoushi/widget/general/card/kare_kyoushi_card.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_progress_bar.dart';
import 'package:kare_kyoushi/widget/layout/spacing_row.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class HomeListItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  final VoidCallback? onTapped;
  final List<CharacterProgress>? progress;

  const HomeListItem({
    required this.title,
    required this.subTitle,
    required this.color,
    this.progress,
    this.onTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => KKCard(
        onTapped: onTapped,
        child: Column(
          children: [
            Text(
              title,
              style: theme.textThemes.coreTextTheme.titleHeader,
            ),
            Text(
              subTitle,
              style: theme.textThemes.coreTextTheme.copyXtraSubtle.copyWith(color: color),
            ),
            if (progress != null) ...[
              const SizedBox(height: 12),
              SpacingRow(
                children: progress!
                    .map(
                      (progress) => Expanded(
                        child: KKProgressBar(
                          progress1: progress.gotItCharacter,
                          progress2: progress.mehCharacter,
                          progress1Color: progress.difficultyGrade.color,
                          progress2Color: progress.difficultyGrade.colorDark,
                          totalProgress: progress.totalCharacter,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
