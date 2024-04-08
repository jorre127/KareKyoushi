import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKInputField extends StatefulWidget {
  final String? hint;
  final String? value;
  final String? title;
  final bool enabled;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const KKInputField({
    required this.onChanged,
    this.title,
    this.value,
    this.hint,
    this.enabled = true,
    this.controller,
    super.key,
  });

  @override
  State<KKInputField> createState() => _KKInputFieldState();
}

class _KKInputFieldState extends State<KKInputField> {
  late final _controller = widget.controller ?? TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _controller.text = widget.value!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: theme.textThemes.subtleTextTheme.copySubtle,
            ),
            const SizedBox(height: 8),
          ],
          SizedBox(
            height: 44,
            child: TextField(
              style: theme.textThemes.coreTextTheme.bodyNormal,
              controller: _controller,
              enabled: widget.enabled,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                filled: true,
                hintText: widget.hint,
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
        ],
      ),
    );
  }
}
