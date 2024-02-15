import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/general/card/kare_kyoushi_card.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class HomeListItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  final VoidCallback? onTapped;

  const HomeListItem({
    required this.title,
    required this.subTitle,
    required this.color,
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
          ],
        ),
      ),
    );
  }
}
