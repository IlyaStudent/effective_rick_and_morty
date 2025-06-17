import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:retrofit/error_logger.dart';

class ParseErrorLoggerImpl implements ParseErrorLogger {
  final Logger _logger;
  final List<String> _sensitiveKeys;

  ParseErrorLoggerImpl({
    Logger? logger,
    List<String> sensitiveKeys = const ['password', 'token', 'authorization'],
  }) : _logger = logger ?? _defaultLogger(),
       _sensitiveKeys = sensitiveKeys;

  @override
  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    final logMessage = _buildErrorMessage(error, stackTrace, options);
    final sanitizedMessage = _sanitize(logMessage);

    _logToConsole(sanitizedMessage, stackTrace);
  }

  String _buildErrorMessage(
    Object error,
    StackTrace stackTrace,
    RequestOptions options,
  ) {
    final buffer =
        StringBuffer()
          ..writeln('🚨 API Response Parse Error')
          ..writeln('⏰ Time: ${DateTime.now().toIso8601String()}')
          ..writeln('🌐 Endpoint: ${options.method} ${options.uri}')
          ..writeln('📦 Request Type: ${options.responseType}')
          ..writeln('💬 Error Type: ${error.runtimeType}')
          ..writeln('📝 Error Details: ${error.toString()}');

    if (options.data != null) {
      buffer.writeln('📤 Request Body: ${options.data}');
    }

    if (options.extra.containsKey('response_data')) {
      buffer.writeln('📥 Response Data: ${options.extra['response_data']}');
    }

    return buffer.toString();
  }

  String _sanitize(String message) {
    for (final key in _sensitiveKeys) {
      message = message.replaceAllMapped(
        RegExp('"$key":\\s*"[^"]+"', caseSensitive: false),
        (match) => '"$key": "***"',
      );
    }
    return message;
  }

  void _logToConsole(String message, StackTrace stackTrace) {
    if (kDebugMode) {
      _logger.e(message, error: message, stackTrace: stackTrace);
    }
  }

  static Logger _defaultLogger() => Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      colors: true,
      printEmojis: true,
    ),
  );
}
