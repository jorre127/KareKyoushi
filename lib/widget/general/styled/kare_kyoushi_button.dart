import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/styles/theme_data.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/styles/theme_durations.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_progress_indicator.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

enum ButtonType {
  regular,
  text,
}

class KKButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final bool isExpanded;
  final bool isLoading;
  final VoidCallback? onClick;
  final ButtonType buttonType;

  const KKButton({
    required this.text,
    required this.onClick,
    this.isLoading = false,
    this.isExpanded = true,
    this.isEnabled = true,
    this.buttonType = ButtonType.regular,
    super.key,
  });

  const KKButton.text({
    required this.text,
    required this.onClick,
    this.isLoading = false,
    this.isExpanded = false,
    this.isEnabled = true,
    this.buttonType = ButtonType.text,
    super.key,
  });

  TextStyle _enabledTextStyle(KKTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.textThemes.inverseCoreTextTheme.titleHeader;
      case ButtonType.text:
        return theme.textThemes.accent5TextTheme.titleHeader;
    }
  }

  TextStyle _disabledTextStyle(KKTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.textThemes.inverseCoreTextTheme.titleHeader;
      case ButtonType.text:
        return theme.textThemes.disabledTextTheme.titleHeader;
    }
  }

  Color? _enabledButtonColor(KKTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.colorsTheme.button;
      case ButtonType.text:
        return null;
    }
  }

  Color? _disabledButtonColor(KKTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.colorsTheme.bgCard;
      case ButtonType.text:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) {
        final content = Row(
          mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) ...[
              const KKProgressIndicator.dark(),
            ] else ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: AnimatedDefaultTextStyle(
                  style: isEnabled ? _enabledTextStyle(theme) : _disabledTextStyle(theme),
                  duration: ThemeDurations.shortAnimationDuration,
                  child: Text(text),
                ),
              ),
            ]
          ],
        );
        if (context.isIOSTheme) {
          return TouchFeedBack(
            onClick: isEnabled ? onClick : null,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: isEnabled ? _enabledButtonColor(theme) : _disabledButtonColor(theme),
                borderRadius: ThemeDimens.buttonBorderRadius,
              ),
              duration: ThemeDurations.shortAnimationDuration,
              child: content,
            ),
          );
        }
        return AnimatedContainer(
          decoration: BoxDecoration(
            color: isEnabled ? _enabledButtonColor(theme) : _disabledButtonColor(theme),
            borderRadius: ThemeDimens.buttonBorderRadius,
          ),
          duration: ThemeDurations.shortAnimationDuration,
          child: TouchFeedBack(
            onClick: isEnabled ? onClick : null,
            child: content,
          ),
        );
      },
    );
  }
}
