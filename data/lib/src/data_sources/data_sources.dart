library;

import 'package:data/data.dart';
import 'package:data/src/data_sources/data_sources_endpoints.dart';
import 'package:data/src/data_sources/local/database/database.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:drift/drift.dart';
import 'package:pool/pool.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart' as http;

// --- Generated --- //
part 'data_sources.g.dart';

// --- Remote --- //
part 'remote/characters_remote_data_source.dart';
part 'remote/images_remote_data_source.dart';

// --- Local --- //
part 'local/characters_local_data_source.dart';
part 'local/images_local_data_source.dart';
