part of 'widgets.dart';

class CharactersSliverListView extends StatelessWidget {
  final List<CharacterEntity> data;
  const CharactersSliverListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: data.length,
      itemBuilder: (_, index) {
        final character = data[index];

        return CharacterCardWidget(character: character);
      },
    );
  }
}
