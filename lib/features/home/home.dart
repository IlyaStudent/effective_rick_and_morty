library;

import 'package:auto_route/auto_route.dart';
import 'package:effective_rick_and_morty/core/di/dependencies.dart';
import 'package:effective_rick_and_morty/core/extensions/extensions.dart';
import 'package:effective_rick_and_morty/core/routes/app_router.gr.dart';
import 'package:effective_rick_and_morty/core/utils/api_response_state/api_response_state.dart';
import 'package:effective_rick_and_morty/core/utils/state_controller/state_controller.dart';
import 'package:effective_rick_and_morty/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// -- Generated --- //
part 'home.freezed.dart';

// --- Routes --- //
part 'presentation/home_routes.dart';

// --- Screens --- //
part 'presentation/screens/home_screen.dart';

// --- Widgets --- //

// --- Bloc --- //
part 'bloc/characters_list_bloc/characters_list_bloc.dart';
part 'bloc/characters_list_bloc/characters_list_event.dart';
