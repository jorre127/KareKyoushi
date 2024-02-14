import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKInputField extends StatelessWidget {
  final String hint;
  final bool enabled;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const KKInputField({
    required this.hint,
    required this.onChanged,
    this.enabled = true,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => TextField(
        style: theme.coreTextTheme.bodyNormal,
        controller: controller,
        enabled: enabled,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          hintText: hint,
          hintStyle: theme.coreTextTheme.bodyNormal.copyWith(color: theme.colorsTheme.inputFieldHint),
          fillColor: theme.colorsTheme.inputFieldFill,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.colorsTheme.inputFieldBorderEnabled),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.colorsTheme.inputFieldBorderFocused),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.colorsTheme.bottomNavbarItemInactive),
          ),
        ),
      ),
    );
  }
}
