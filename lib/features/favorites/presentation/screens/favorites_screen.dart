part of '../../favorites.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget implements AutoRouteWrapper {
  const FavoritesScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    final bloc = getIt<FavoriteCharactersListBloc>();

    bloc.add(FavoriteCharactersListEvent.getAllFavoriteCharacters());
    return BlocProvider(create: (context) => bloc, child: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<
        FavoriteCharactersListBloc,
        FavoriteCharactersListState
      >(
        builder: (context, state) {
          return state.map(
            initial: () {
              return SizedBox.shrink();
            },
            loading: () {
              return CustomLoadingIndicatorWidget();
            },
            successful: (data) {
              return FilteredCharactersListWigdet(
                characters: data.characters,
                onRefresh:
                    () async => context.favoriteCharactersListBloc.add(
                      FavoriteCharactersListEvent.getAllFavoriteCharacters(),
                    ),
              );
            },
            error: (exception) {
              return CustomErrorWidget(exception: exception);
            },
          );
        },
      ),
    );
  }
}
