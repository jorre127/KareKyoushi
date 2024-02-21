import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/styles/theme_data.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/styles/theme_durations.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_progress_indicator.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

enum ButtonType {
  small,
  regular,
  text,
}

class ButtonData {
  final TextStyle enabledTextStyle;
  final TextStyle disabledTextStyle;
  final Color? enabledButtonColor;
  final Color? disabledButtonColor;
  final EdgeInsets padding;

  ButtonData({
    required this.enabledTextStyle,
    required this.disabledTextStyle,
    required this.enabledButtonColor,
    required this.disabledButtonColor,
    required this.padding,
  });
}

class KKButton extends StatelessWidget {
  final String text;
  final Color? color;
  final bool isEnabled;
  final bool isExpanded;
  final bool isLoading;
  final VoidCallback? onClick;
  final ButtonType buttonType;

  const KKButton({
    required this.text,
    required this.onClick,
    this.color,
    this.isLoading = false,
    this.isExpanded = true,
    this.isEnabled = true,
    this.buttonType = ButtonType.regular,
    super.key,
  });

  const KKButton.text({
    required this.text,
    required this.onClick,
    this.color,
    this.isLoading = false,
    this.isExpanded = false,
    this.isEnabled = true,
    this.buttonType = ButtonType.text,
    super.key,
  });

  ButtonData _getButtonData({required KKTheme theme, required ButtonType type}) => switch (type) {
        ButtonType.small => ButtonData(
            enabledTextStyle: theme.textThemes.inverseCoreTextTheme.action,
            disabledTextStyle: theme.textThemes.inverseCoreTextTheme.action,
            enabledButtonColor: theme.colorsTheme.button,
            disabledButtonColor: theme.colorsTheme.bgCard,
            padding: const EdgeInsets.all(8),
          ),
        ButtonType.regular => ButtonData(
            enabledTextStyle: theme.textThemes.inverseCoreTextTheme.action,
            disabledTextStyle: theme.textThemes.inverseCoreTextTheme.action,
            enabledButtonColor: theme.colorsTheme.button,
            disabledButtonColor: theme.colorsTheme.bgCard,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
          ),
        ButtonType.text => ButtonData(
            enabledTextStyle: theme.textThemes.accent5TextTheme.titleHeader,
            disabledTextStyle: theme.textThemes.disabledTextTheme.titleHeader,
            enabledButtonColor: null,
            disabledButtonColor: null,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
          ),
      };

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) {
        final data = _getButtonData(
          theme: theme,
          type: buttonType,
        );
        final content = Row(
          mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: data.padding,
              child: isLoading
                  ? const KKProgressIndicator.light()
                  : AnimatedDefaultTextStyle(
                      style: isEnabled ? data.enabledTextStyle : data.disabledTextStyle,
                      duration: ThemeDurations.shortAnimationDuration,
                      child: Text(text),
                    ),
            ),
          ],
        );
        if (context.isIOSTheme) {
          return TouchFeedBack(
            onClick: isEnabled
                ? () {
                    HapticFeedback.mediumImpact();
                    onClick?.call();
                  }
                : null,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: color ?? (isEnabled ? data.enabledButtonColor : data.disabledButtonColor),
                borderRadius: ThemeDimens.buttonBorderRadius,
              ),
              duration: ThemeDurations.shortAnimationDuration,
              child: content,
            ),
          );
        }
        return AnimatedContainer(
          decoration: BoxDecoration(
            color: color ?? (isEnabled ? data.enabledButtonColor : data.disabledButtonColor),
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
