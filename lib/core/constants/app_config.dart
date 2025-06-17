import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppConfig {
  static const String envFileName = '.env';

  static final String baseUrl = dotenv.get('BASE_URL');
}
