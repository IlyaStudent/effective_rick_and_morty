import 'package:effective_rick_and_morty/core/exceptions/custom_exception.dart';

abstract class ExceptionMapper {
  CustomException map(Object? error);
}
