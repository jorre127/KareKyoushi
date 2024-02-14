import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/styles/theme_data.dart';

extension ThemeExtension on Object {
  KKTheme get theme => getIt();
}
