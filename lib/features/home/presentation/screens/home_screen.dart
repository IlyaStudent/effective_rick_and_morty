part of '../../home.dart';

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    final bloc = getIt<CharactersListBloc>();
    bloc.add(CharactersListEvent.getAllCharacters());

    return BlocProvider(create: (context) => bloc, child: this);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;

  final _threshold = 50;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onScroll() {
    final state = context.charactersListBloc.state;
    if (state.isLoading || !state.hasData || state.data!.info.hasReachEnd) {
      return;
    }

    final position = _scrollController.position;
    final maxScroll = position.maxScrollExtent;
    final currentScroll = position.pixels;

    if (maxScroll - currentScroll <= _threshold) {
      context.charactersListBloc.add(CharactersListEvent.getAllCharacters());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CharactersListBloc, CharactersListState>(
        builder: (context, state) {
          // if (state.isInitial) {
          //   return SizedBox.shrink();
          // }
          // if (!state.hasData && state.isLoading) {
          //   return CustomLoadingIndicatorWidget();
          // }
          // if (!state.hasData && state.hasError) {
          //   return CustomErrorWidget(exception: state.exception!);
          // }

          // final data = state.data!;

          // return HomeBodyWidget(data: data);

          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  context.charactersListBloc.add(
                    CharactersListEvent.refreshCharactersList(),
                  );
                },
                child: CustomScrollView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    if (state.hasData) ...[
                      () {
                        final characters = state.data!.characters;

                        if (characters.isEmpty) {
                          return SliverFillRemaining(
                            hasScrollBody: false,
                            child: AppText.cofosansBodyLarge(
                              context.localization.noCharacters,
                            ),
                          );
                        }

                        return CharactersSliverListView(data: characters);
                      }(),
                    ] else ...[
                      if (state.hasError)
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: CustomErrorWidget(
                              exception: state.exception!,
                            ),
                          ),
                        ),
                    ],
                  ],
                ),
              ),
              if (state.isLoading)
                Positioned.fill(
                  child: ColoredBox(
                    color: Colors.white.withValues(alpha: .3),
                    child: Center(child: CustomLoadingIndicatorWidget()),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
