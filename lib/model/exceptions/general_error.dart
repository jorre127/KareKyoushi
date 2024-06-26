import 'package:kare_kyoushi/util/locale/localization_keys.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class GeneralError with LocalizedError {
  GeneralError() : super();

  @override
  String getLocalizedKey() => LocalizationKeys.errorGeneral;
}
