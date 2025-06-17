library;

import 'dart:convert';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

// --- Generated --- //
part 'database.g.dart';

// --- AppDatabse --- //
part 'app_database.dart';

// --- Converters --- //
part 'coverters/location_converter.dart';
part 'coverters/list_converter.dart';
part 'coverters/character_converter.dart';
part 'coverters/images_converter.dart';

// --- DAOs --- //
part 'daos/images_dao.dart';
part 'daos/characters_dao.dart';

// --- Tables --- //
part 'tables/characters_table.dart';
part 'tables/images_table.dart';
part 'tables/favorite_characters_table.dart';
