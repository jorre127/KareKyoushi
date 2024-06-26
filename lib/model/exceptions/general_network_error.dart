import 'package:kare_kyoushi/util/locale/localization_keys.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class GeneralNetworkError extends NetworkError {
  GeneralNetworkError(super.dioException);

  @override
  String getLocalizedKey() => LocalizationKeys.errorGeneral;

  @override
  String? get getErrorCode => null;
}
