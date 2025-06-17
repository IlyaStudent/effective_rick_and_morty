part of '../../widgets.dart';

class CharacterFavoriteMarkWidget extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback? onTap;
  const CharacterFavoriteMarkWidget({
    super.key,
    required this.isFavorite,
    this.onTap,
  });

  @override
  State<CharacterFavoriteMarkWidget> createState() =>
      _CharacterFavoriteMarkWidgetState();
}

class _CharacterFavoriteMarkWidgetState
    extends State<CharacterFavoriteMarkWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Durations.extralong4,
    );

    _rotateAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _rotate() {
    _animationController.reset();
    _animationController.forward();
  }

  void _onIconTap() {
    widget.onTap?.call();
    _rotate();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotateAnimation,
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: 36,
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        onPressed: _onIconTap,
        icon: Icon(
          widget.isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
        ),
      ),
    );
  }
}
