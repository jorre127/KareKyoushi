import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_back_button.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKHeader extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget> trailingItems;
  final VoidCallback? onBackTapped;

  const KKHeader({
    this.titleWidget,
    this.onBackTapped,
    this.title,
    this.trailingItems = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        padding: const EdgeInsets.only(
          bottom: 12,
          top: 12,
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              if (ModalRoute.of(context)?.impliesAppBarDismissal ?? false) ...[
                KKBackButton.light(onClick: onBackTapped),
              ],
              if (titleWidget != null) ...[
                Expanded(child: titleWidget!),
              ] else if (title != null) ...[
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
