import 'package:flutter/widgets.dart';
import 'package:kare_kyoushi/styles/theme_data.dart';
import 'package:kare_kyoushi/util/locale/localization.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class DataProviderWidget extends BaseThemeProviderWidget<KKTheme, Localization> {
  const DataProviderWidget({
    Widget Function(BuildContext context, KKTheme theme)? childBuilderTheme,
    Widget Function(BuildContext context, Localization localization)? childBuilderLocalization,
    Widget Function(BuildContext context, KKTheme theme, Localization localization)? childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
