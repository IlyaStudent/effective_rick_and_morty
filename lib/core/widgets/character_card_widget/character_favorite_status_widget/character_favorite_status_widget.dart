part of '../../widgets.dart';

class CharacterFavoriteStatusWidget extends StatelessWidget {
  final CharacterEntity character;
  const CharacterFavoriteStatusWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<CharacterFavoriteStatusBloc>();

    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<
        CharacterFavoriteStatusBloc,
        CharacterFavoriteStatusState
      >(
        builder: (context, state) {
          if (state.hasError) {
            return Icon(Icons.error);
          }
          return CharacterFavoriteMarkWidget(
            isFavorite: state.data ?? character.isFavorite,
            onTap:
                state.isLoading
                    ? null
                    : () => context.characterFavoriteStatusBloc.add(
                      CharacterFavoriteStatusEvent.toggleFavoriteStatus(
                        character: character,
                      ),
                    ),
          );
        },
      ),
    );
  }
}
