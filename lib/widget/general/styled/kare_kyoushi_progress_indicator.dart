import 'package:flutter/material.dart';
import 'package:kare_kyoushi/util/env/flavor_config.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKProgressIndicator extends StatelessWidget {
  final bool dark;

  const KKProgressIndicator({
    required this.dark,
    super.key,
  });

  const KKProgressIndicator.dark({super.key}) : dark = true;

  const KKProgressIndicator.light({super.key}) : dark = false;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) {
        if (FlavorConfig.isInTest()) {
          return Container(
            color: theme.colorsTheme.accent,
            height: 50,
            width: 50,
            child: const Text(
              'CircularProgressIndicator',
              style: TextStyle(fontSize: 8),
            ),
          );
        }
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(dark ? theme.colorsTheme.progressIndicator : theme.colorsTheme.inverseProgressIndicator),
        );
      },
    );
  }
}
