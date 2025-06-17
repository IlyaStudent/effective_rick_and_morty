library;

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:effective_rick_and_morty/core/di/dependencies.dart';
import 'package:effective_rick_and_morty/core/extensions/extensions.dart';
import 'package:effective_rick_and_morty/core/routes/app_router.gr.dart';
import 'package:effective_rick_and_morty/core/themes/theme_provider.dart';
import 'package:effective_rick_and_morty/core/utils/api_response_state/api_response_state.dart';
import 'package:effective_rick_and_morty/core/utils/characters_sort_type_enum.dart';
import 'package:effective_rick_and_morty/core/utils/state_controller/state_controller.dart';
import 'package:effective_rick_and_morty/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// --- Generated --- //
part 'favorites.freezed.dart';

// --- Routes --- //
part 'presentation/favorites_routes.dart';

// --- Bloc --- //
part 'bloc/favortite_characters_bloc/favorite_characters_list_bloc.dart';
part 'bloc/favortite_characters_bloc/favorite_characters_list_event.dart';

// --- Screens --- //
part '../favorites/presentation/screens/favorites_screen.dart';

// --- Widgets --- //
part 'presentation/widgets/sort_type_select_widget.dart';
part 'presentation/widgets/filtered_characters_list_wigdet.dart';
