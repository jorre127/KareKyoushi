import 'dart:io';

import 'package:kare_kyoushi/util/locale/localization_keys.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class InternalServerError extends NetworkError {
  static const statusCode = HttpStatus.internalServerError;

  InternalServerError(
    super.dioException, {
    super.statusCodeValue,
  });

  @override
  String getLocalizedKey() => LocalizationKeys.errorInternalServer;

  @override
  String? get getErrorCode {
    if (statusCodeValue == null) return '$statusCode';
    return '$statusCode [$statusCodeValue]';
  }
}
