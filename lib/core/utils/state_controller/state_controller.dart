import 'dart:async';

import 'package:effective_rick_and_morty/core/exceptions/custom_exception.dart';

abstract class StateController {
  Future<void> handleProccess<T>(
    Future<T> Function() process, {
    FutureOr<void> Function()? onLoading,
    FutureOr<void> Function(T? data)? onSuccess,
    FutureOr<void> Function(CustomException exception)? onError,
  });
}
