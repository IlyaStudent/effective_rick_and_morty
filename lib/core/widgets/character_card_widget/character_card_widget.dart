part of '../widgets.dart';

class CharacterCardWidget extends StatelessWidget {
  final CharacterEntity character;
  const CharacterCardWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final birthDate = DateTime.parse(character.created).formattedDate;

    return Card(
      child: Container(
        height: 124,
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: CharacterFavoriteStatusWidget(character: character),
            ),
            Row(
              spacing: 16,
              children: [
                SizedBox(
                  height: 84,
                  width: 84,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(imageUrl: character.image),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      AppText.cofosansTitleMedium(
                        character.name,
                        decoration: TextDecoration.underline,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      AppText.cofosansBodyLarge(character.gender),
                      AppText.cofosansBodyLarge(
                        '$birthDate | ${character.status}',
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
