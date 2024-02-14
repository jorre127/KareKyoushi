import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKInputField extends StatelessWidget {
  final String? hint;
  final bool enabled;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const KKInputField({
    required this.onChanged,
    this.hint,
    this.enabled = true,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => SizedBox(
        height: 44,
        child: TextField(
          style: theme.textThemes.coreTextTheme.bodyNormal,
          controller: controller,
          enabled: enabled,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            filled: true,
            hintText: hint,
            hintStyle: theme.textThemes.coreTextTheme.bodyNormal.copyWith(color: theme.colorsTheme.inputFieldHint),
            fillColor: theme.colorsTheme.bgCard,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorsTheme.bgCard),
              borderRadius: ThemeDimens.inputBorderRadius,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorsTheme.bgCard),
              borderRadius: ThemeDimens.inputBorderRadius,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorsTheme.bgCard),
              borderRadius: ThemeDimens.inputBorderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
