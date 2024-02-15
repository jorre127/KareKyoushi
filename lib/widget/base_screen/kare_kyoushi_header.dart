import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_back_button.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKHeader extends StatelessWidget {
  final String? title;
  final List<Widget> trailingItems;
  final VoidCallback? onBackTapped;

  const KKHeader({
    this.onBackTapped,
    this.title,
    this.trailingItems = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              if (ModalRoute.of(context)?.impliesAppBarDismissal ?? false) ...[
                KKBackButton.light(onClick: onBackTapped),
                const SizedBox(width: 12),
              ],
              if (title != null) ...[
                Expanded(
                  child: Text(
                    title!,
                    style: theme.textThemes.coreTextTheme.titleHeader,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              if (ModalRoute.of(context)?.impliesAppBarDismissal ?? false) ...[
                IgnorePointer(
                  child: Opacity(
                    opacity: 0,
                    child: KKBackButton.light(onClick: () {}),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
