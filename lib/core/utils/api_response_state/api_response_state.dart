import 'package:effective_rick_and_morty/core/exceptions/custom_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_response_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
sealed class ApiResponseState<T> with _$ApiResponseState<T> {
  const ApiResponseState._();

  const factory ApiResponseState.initial() = _ApiResponseStateInitial;
  const factory ApiResponseState.loading({T? data}) = _ApiResponseStateLoading;
  const factory ApiResponseState.successful({required T data}) =
      _ApiResponseStateSuccessful;
  const factory ApiResponseState.error({
    required CustomException exception,
    T? data,
  }) = _ApiResponseStateError;

  bool get isInitial => this is _ApiResponseStateInitial;
  bool get isLoading => this is _ApiResponseStateLoading;
  bool get hasError => this is _ApiResponseStateError;

  bool get hasData => map(
    initial: () => false,
    loading: () => (this as _ApiResponseStateLoading).data != null,
    successful: (_) => true,
    error: (_) => false,
  );

  T? get data => hasData ? this.data! : null;

  CustomException? get exception => hasError ? this.exception : null;

  R map<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(T data) successful,
    required R Function(CustomException exception) error,
  }) {
    return switch (this) {
      _ApiResponseStateInitial<T> _ => initial(),
      _ApiResponseStateLoading<T> _ => loading(),
      _ApiResponseStateSuccessful<T> _ => successful(
        (this as _ApiResponseStateSuccessful).data as T,
      ),
      _ApiResponseStateError<T> _ => error(
        (this as _ApiResponseStateError).exception,
      ),
    };
  }
}
