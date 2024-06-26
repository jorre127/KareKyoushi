import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/architecture.dart';
import 'package:kare_kyoushi/util/web/app_configurator.dart' if (dart.library.html) 'package:kare_kyoushi/util/web/app_configurator_web.dart';

Future<void> _setupCrashLogging() async {
  await Firebase.initializeApp(
    options: kIsWeb
        ? const FirebaseOptions(
            apiKey: "AIzaSyAH10KGLm4URHu-6DQk5d-AbOQRG4hHEMg",
            authDomain: "karekyoushi.firebaseapp.com",
            projectId: "karekyoushi",
            storageBucket: "karekyoushi.appspot.com",
            messagingSenderId: "94968713297",
            appId: "1:94968713297:web:79790d4cad2525c1f46870",
            measurementId: "G-Z6JE3PPNB2",
          )
        : null,
  );
  if (kIsWeb) return;
  if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) unawaited(FirebaseCrashlytics.instance.sendUnsentReports());
  final originalOnError = FlutterError.onError;
  FlutterError.onError = (errorDetails) async {
    if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
    originalOnError?.call(errorDetails);
  };
}

FutureOr<R>? wrapMain<R>(FutureOr<R> Function() appCode) async {
  PlatformDispatcher.instance.onError = (error, trace) {
    try {
      WidgetsFlutterBinding.ensureInitialized();
    } catch (_) {}

    try {
      staticLogger.e('Uncaught platform error', error: error, stackTrace: trace);
    } catch (_) {
      // ignore: avoid_print
      print(error);
      // ignore: avoid_print
      print(trace);
    }

    if (!kIsWeb && FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
      FirebaseCrashlytics.instance.recordError(error, trace);
    }
    return true; // Handled
  };

  WidgetsFlutterBinding.ensureInitialized();
  configureWebApp();
  await _setupCrashLogging();
  await initArchitecture();

  return await appCode();
}
