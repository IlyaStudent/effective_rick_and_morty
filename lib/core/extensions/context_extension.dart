part of 'extensions.dart';

extension ContextExtension on BuildContext {
  AppRouter get appRouter => AppRouter();

  NavigatorState get navigator => Navigator.of(this);

  S get localization => S.of(this);

  ThemeProvider get themeProvider =>
      Provider.of<ThemeProvider>(this, listen: false);

  CharactersListBloc get charactersListBloc => read<CharactersListBloc>();

  ImageCubit get imageCubit => read<ImageCubit>();

  CharacterFavoriteStatusBloc get characterFavoriteStatusBloc =>
      read<CharacterFavoriteStatusBloc>();

  FavoriteCharactersListBloc get favoriteCharactersListBloc =>
      read<FavoriteCharactersListBloc>();
}
