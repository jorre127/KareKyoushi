import 'package:flutter/material.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/util/logger/kare_kyoushi_logger.dart';

extension FutureExtension<T> on Future<T> {
  Future<T?> withErrorHandling({
    required String errorMessage,
    bool showSnackbar = true,
    ValueChanged<T>? onSuccess,
    ValueChanged<Object>? onError,
  }) async {
    try {
      final result = await this;
      onSuccess?.call(result);
      return result;
    } catch (error, trace) {
      if (showSnackbar) {
        WidgetsBinding.instance.addPostFrameCallback((_) => getIt<MainNavigator>().showError(error));
      }
      onError?.call(error);
      KKLogger.logError(
        errorMessage,
        error: error,
        trace: trace,
      );
    }
    return null;
  }
}
