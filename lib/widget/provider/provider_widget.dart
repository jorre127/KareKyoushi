import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/styles/theme_data.dart';
import 'package:kare_kyoushi/util/locale/localization.dart';

class ProviderWidget<T extends ChangeNotifier> extends BaseProviderWidget<T, KKTheme, Localization> {
  const ProviderWidget({
    required super.create,
    super.child,
    super.childBuilder,
    super.childBuilderWithViewModel,
    super.consumerChild,
    super.consumer,
    super.consumerWithThemeAndLocalization,
    super.lazy,
    super.key,
  });
}
