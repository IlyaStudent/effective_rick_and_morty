part of 'widgets.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final String text;

  const HeaderDelegate({required this.text});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      alignment: shrinkOffset > 1 ? Alignment.topLeft : Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor.withAlpha(shrinkOffset.toInt() * 50),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
      ),
      padding: EdgeInsets.all(10),
      height: maxExtent,

      child: AppText.cofosansHeadlineMedium(text),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
