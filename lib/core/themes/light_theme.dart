part of 'theme_provider.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF42A5F5),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF42A5F5),
    secondary: Color(0xFFFF7043),
    surface: Colors.white,
    onPrimary: Colors.white,
  ),
  scaffoldBackgroundColor: const Color(0xFFE3F2FD),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF42A5F5),
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: Color(0xFFFF7043), width: 1),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF7043),
    foregroundColor: Colors.white,
  ),
  iconTheme: const IconThemeData(color: Color(0xFF42A5F5)),
  textTheme: TextTheme(
    displayMedium: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A237E),
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.grey[800]),
  ),
);
