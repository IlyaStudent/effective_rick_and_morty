import 'package:effective_rick_and_morty/core/di/dependencies.dart';
import 'package:effective_rick_and_morty/rick_and_morty_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  runApp(RickAndMortyApp());
}
