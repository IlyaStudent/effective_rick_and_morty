part of '../../favorites.dart';

class FilteredCharactersListWigdet extends StatefulWidget {
  final List<CharacterEntity> characters;
  final RefreshCallback onRefresh;

  const FilteredCharactersListWigdet({
    super.key,
    required this.characters,
    required this.onRefresh,
  });

  @override
  State<FilteredCharactersListWigdet> createState() =>
      _FilteredCharactersListWigdetState();
}

class _FilteredCharactersListWigdetState
    extends State<FilteredCharactersListWigdet> {
  late final ValueNotifier<List<CharacterEntity>> _sortedCharacters;

  @override
  void initState() {
    super.initState();
    _sortedCharacters = ValueNotifier<List<CharacterEntity>>(widget.characters);
  }

  void _onSortTypeAccept(CharactersSortType sortType) {
    final sorted = sortType.sortList(widget.characters);
    _acceptSortedCharacters(sorted);
  }

  void _acceptSortedCharacters(List<CharacterEntity> sorted) {
    _sortedCharacters.value = sorted;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SortTypeSelectWidget(onSortTypeAccept: _onSortTypeAccept),
          Flexible(
            child: CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              slivers: [
                ValueListenableBuilder<List<CharacterEntity>>(
                  valueListenable: _sortedCharacters,
                  builder: (context, sortedCharacters, _) {
                    return CharactersSliverListView(
                      key: ValueKey(sortedCharacters.hashCode),
                      data: sortedCharacters,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
