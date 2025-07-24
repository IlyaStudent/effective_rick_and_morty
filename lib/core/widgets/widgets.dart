library;

import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:effective_rick_and_morty/core/di/dependencies.dart';
import 'package:effective_rick_and_morty/core/exceptions/custom_exception.dart';
import 'package:effective_rick_and_morty/core/extensions/extensions.dart';
import 'package:effective_rick_and_morty/core/routes/app_router.gr.dart';
import 'package:effective_rick_and_morty/core/styles/app_colors.dart';
import 'package:effective_rick_and_morty/core/styles/text_styles.dart';
import 'package:effective_rick_and_morty/core/utils/api_response_state/api_response_state.dart';
import 'package:effective_rick_and_morty/core/utils/state_controller/state_controller.dart';
import 'package:effective_rick_and_morty/core/widgets/widgets_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// -- Generated --- //
part 'widgets.freezed.dart';

// --- AppText --- //
part 'app_text/app_text.dart';
part 'app_text/app_text_factory.dart';

// --- NavBar --- //
part 'nav_bar/app_nav_bar.dart';
part 'nav_bar/app_scaffold.dart';

// --- CustomErrorWidget --- //
part 'custom_error_widget.dart';

// --- CustomLoadingIndicatorWidget --- //
part 'custom_loading_indicator_widget.dart';

// --- HeaderDelegate --- //
part 'header_delegate.dart';

// --- CachedNetworkImage --- //
part 'cached_network_image/cached_network_image.dart';
part 'cached_network_image/image_cubit/image_cubit.dart';

// --- CharactersSliverListView --- //
part 'characters_sliver_list_view.dart';

// --- CharacterCardWidget --- //
part 'character_card_widget/character_card_widget.dart';
part 'character_card_widget/character_favorite_status_widget/character_favorite_status_widget.dart';
part 'character_card_widget/character_favorite_status_widget/bloc/character_favorite_status_bloc.dart';
part 'character_card_widget/character_favorite_status_widget/bloc/character_favorite_status_event.dart';
part 'character_card_widget/character_favorite_status_widget/character_favorite_mark_widget.dart';
