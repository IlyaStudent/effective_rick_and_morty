part of '../../favorites.dart';

class SortTypeSelectWidget extends StatefulWidget {
  final ValueChanged<CharactersSortType> onSortTypeAccept;
  const SortTypeSelectWidget({super.key, required this.onSortTypeAccept});

  @override
  State<SortTypeSelectWidget> createState() => _SortTypeSelectWidgetState();
}

class _SortTypeSelectWidgetState extends State<SortTypeSelectWidget> {
  CharactersSortType _selectedSortType = CharactersSortType.byDefault;

  Future<void> _onTap() async {
    final modalSelected = ValueNotifier<CharactersSortType>(_selectedSortType);

    await showModalBottomSheet<void>(
      showDragHandle: true,

      sheetAnimationStyle: AnimationStyle(
        curve: Curves.easeOutBack,
        duration: Durations.medium3,
      ),
      context: context,
      builder: (context) {
        return ValueListenableBuilder<CharactersSortType>(
          valueListenable: modalSelected,
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 12, left: 16),
                  child: AppText.cofosansTitleLarge(
                    context.localization.selectSortType,
                  ),
                ),
                ...CharactersSortType.values.map((sortType) {
                  return RadioMenuButton(
                    value: sortType,
                    groupValue: value,
                    onChanged: (value) {
                      modalSelected.value = value!;
                    },
                    child: AppText.cofosansBodyLarge(sortType.name),
                  );
                }),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: FilledButton(
                    onPressed: () => _acceptSortType(value),
                    child:
                        value == _selectedSortType
                            ? AppText.cofosansBodyLarge('Close')
                            : AppText.cofosansBodyLarge('Apply'),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _acceptSortType(CharactersSortType sortType) {
    setState(() {
      _selectedSortType = sortType;
      context.navigator.pop();
    });

    widget.onSortTypeAccept(_selectedSortType);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: _onTap,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              Icon(Icons.filter_alt_rounded),
              Row(
                spacing: 2,
                children: [
                  AppText.cofosansBodyLarge(context.localization.sort),
                  AppText.cofosansBodyLarge(
                    _selectedSortType.name,
                    color: lightTheme.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
