import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:effective_rick_and_morty/core/constants/app_config.dart';
import 'package:effective_rick_and_morty/core/exceptions/exception_mapper/exception_mapper.dart';
import 'package:effective_rick_and_morty/core/exceptions/exception_mapper/exception_mapper_impl.dart';
import 'package:effective_rick_and_morty/core/networks/parse_error_logger_impl.dart';
import 'package:effective_rick_and_morty/core/networks/notifications/push_notification_service.dart';
import 'package:effective_rick_and_morty/core/routes/app_router.dart';
import 'package:effective_rick_and_morty/core/utils/state_controller/state_controller.dart';
import 'package:effective_rick_and_morty/core/utils/state_controller/state_controller_impl.dart';
import 'package:effective_rick_and_morty/core/widgets/widgets.dart';
import 'package:effective_rick_and_morty/features/favorites/favorites.dart';
import 'package:effective_rick_and_morty/features/home/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:retrofit/error_logger.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await dotenv.load(fileName: AppConfig.envFileName);

  getIt
    // --- Database --- //
    ..registerLazySingleton<AppDatabase>(() => AppDatabase())
    // --- DAO --- //
    ..registerLazySingleton<CharactersDAO>(() => CharactersDAO(getIt()))
    ..registerLazySingleton<ImagesDAO>(() => ImagesDAO(getIt()))
    // --- Data sources --- //
    ..registerLazySingleton<CharactersRemoteDataSource>(
      () => CharactersRemoteDataSource(getIt()),
    )
    ..registerLazySingleton<CharactersLocalDataSource>(
      () => CharactersLocalDataSource(dao: getIt()),
    )
    ..registerLazySingleton<ImagesLocalDataSource>(
      () => ImagesLocalDataSource(dao: getIt()),
    )
    ..registerLazySingleton<ImagesRemoteDataSource>(
      () => ImagesRemoteDataSource(getIt()),
    )
    // --- Repositories --- //
    ..registerLazySingleton<CharactersRepository>(
      () => CharactersRepositoryImpl(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ),
    )
    ..registerLazySingleton<ImagesRepository>(
      () => ImagesRepositoryImpl(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ),
    )
    // --- Use cases --- //
    ..registerLazySingleton<GetAllCharactersUseCase>(
      () => GetAllCharactersUseCase(repository: getIt()),
    )
    ..registerLazySingleton<GetImageDataUseCase>(
      () => GetImageDataUseCase(repository: getIt()),
    )
    ..registerLazySingleton<ToggleCharacterFavoriteStatusUseCase>(
      () => ToggleCharacterFavoriteStatusUseCase(repository: getIt()),
    )
    ..registerLazySingleton<GetFavoriteCharactersUseCase>(
      () => GetFavoriteCharactersUseCase(repository: getIt()),
    )
    // --- Bloc & Cubit --- //
    ..registerFactory<ImageCubit>(
      () => ImageCubit(stateController: getIt(), useCase: getIt()),
    )
    ..registerFactory<CharactersListBloc>(
      () => CharactersListBloc(stateController: getIt(), useCase: getIt()),
    )
    ..registerFactory<CharacterFavoriteStatusBloc>(
      () => CharacterFavoriteStatusBloc(
        stateController: getIt(),
        useCase: getIt(),
      ),
    )
    ..registerFactory<FavoriteCharactersListBloc>(
      () => FavoriteCharactersListBloc(
        stateController: getIt(),
        useCase: getIt(),
      ),
    )
    // --- Routing --- //
    ..registerLazySingleton<AppRouter>(() => AppRouter())
    // --- External --- //
    ..registerLazySingleton<ParseErrorLogger>(() => ParseErrorLoggerImpl())
    ..registerLazySingleton<ExceptionMapper>(() => ExceptionMapperImpl())
    ..registerLazySingleton<StateController>(
      () => StateControllerImpl(exceptionMapper: getIt<ExceptionMapper>()),
    )
    ..registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      ),
    );
}

Future<void> initTestDependencies() async {
  await dotenv.load(fileName: AppConfig.envFileName);

  getIt
    // --- Repositories --- //
    ..registerLazySingleton<CharactersRepository>(
      () => CharactersRepositoryFake(),
    )
    ..registerLazySingleton<ImagesRepository>(() => ImagesRepositoryFake())
    // --- Use cases --- //
    ..registerLazySingleton<GetAllCharactersUseCase>(
      () => GetAllCharactersUseCase(repository: getIt()),
    )
    ..registerLazySingleton<GetImageDataUseCase>(
      () => GetImageDataUseCase(repository: getIt()),
    )
    ..registerLazySingleton<ToggleCharacterFavoriteStatusUseCase>(
      () => ToggleCharacterFavoriteStatusUseCase(repository: getIt()),
    )
    ..registerLazySingleton<GetFavoriteCharactersUseCase>(
      () => GetFavoriteCharactersUseCase(repository: getIt()),
    )
    // --- Bloc & Cubit --- //
    ..registerFactory<ImageCubit>(
      () => ImageCubit(stateController: getIt(), useCase: getIt()),
    )
    ..registerFactory<CharactersListBloc>(
      () => CharactersListBloc(stateController: getIt(), useCase: getIt()),
    )
    ..registerFactory<CharacterFavoriteStatusBloc>(
      () => CharacterFavoriteStatusBloc(
        stateController: getIt(),
        useCase: getIt(),
      ),
    )
    ..registerFactory<FavoriteCharactersListBloc>(
      () => FavoriteCharactersListBloc(
        stateController: getIt(),
        useCase: getIt(),
      ),
    )
    // --- Routing --- //
    ..registerLazySingleton<AppRouter>(() => AppRouter())
    // --- External --- //
    ..registerLazySingleton<ParseErrorLogger>(() => ParseErrorLoggerImpl())
    ..registerLazySingleton<ExceptionMapper>(() => ExceptionMapperImpl())
    ..registerLazySingleton<StateController>(
      () => StateControllerImpl(exceptionMapper: getIt<ExceptionMapper>()),
    );
}
