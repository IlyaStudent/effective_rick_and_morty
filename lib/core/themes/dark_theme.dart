part of 'theme_provider.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF00B0FF),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF00B0FF),
    secondary: Color(0xFFFF5252),
    surface: Color(0xFF1A1A2E),
    onPrimary: Colors.black,
  ),
  scaffoldBackgroundColor: const Color(0xFF0A0A1F),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1A1A2E),
    foregroundColor: Color(0xFF00B0FF),
    iconTheme: IconThemeData(color: Color(0xFF00B0FF)),
  ),
  cardTheme: CardThemeData(
    color: const Color(0xFF1A1A2E),
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: Color(0xFFFF5252), width: 1),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF5252),
    foregroundColor: Colors.white,
  ),
  iconTheme: const IconThemeData(color: Color(0xFF00B0FF)),
  textTheme: TextTheme(
    displayMedium: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color(0xFF00B0FF),
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.grey[300]),
  ),
);
