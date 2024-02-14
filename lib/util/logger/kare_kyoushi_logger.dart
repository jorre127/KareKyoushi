import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/exceptions/forbidden_error.dart';
import 'package:kare_kyoushi/model/exceptions/no_internet_error.dart';
import 'package:kare_kyoushi/model/exceptions/un_authorized_error.dart';

class KKLogger {
  static FirebaseCrashlytics get _firebaseCrashlytics => getIt<FirebaseCrashlytics>();

  KKLogger._();

  static void logError(
    String message, {
    required dynamic error,
    required StackTrace trace,
    bool logToFirebase = true,
  }) {
    staticLogger.error(message, error: error, stackTrace: trace);
    if (logToFirebase) _recordToFirebase(message, error: error, trace: trace);
  }

  static void logDebug(String message) {
    staticLogger.d(message);
  }

  static Future<void> _recordToFirebase(
    String message, {
    required dynamic error,
    required StackTrace trace,
  }) async {
    try {
      final shouldNotSendError = error is UnAuthorizedError || error is ForbiddenError || error is NoInternetError || isInDebug;
      if (shouldNotSendError) return;
      await _firebaseCrashlytics.recordError(error, trace, reason: message);
    } catch (error, trace) {
      staticLogger.error('Failed to log to firebase', error: error, stackTrace: trace);
    }
  }
}
