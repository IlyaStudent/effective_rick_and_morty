part of '../widgets.dart';

class AppText extends StatefulWidget {
  final String text;

  final TextStyle style;

  final TextAlign? textAlign;

  final TextOverflow? overflow;

  final int? maxLines;

  final bool uppercase;

  final TextDecoration? decoration;

  final Color? decorationColor;

  final Color? color;

  final bool? softWrap;

  final List<BoxShadow> shadows;

  const AppText(
    this.text, {
    required this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.uppercase = false,
    this.decoration,
    this.decorationColor,
    this.color,
    this.softWrap,
    this.shadows = const [],
    super.key,
  });

  const factory AppText.custom(
    String text, {
    required TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$Custom;

  const factory AppText.cofosansDisplayLarge(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansDisplayLarge;

  const factory AppText.cofosansDisplayMedium(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansDisplayMedium;

  const factory AppText.cofosansDisplaySmall(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansDisplaySmall;

  const factory AppText.cofosansHeadlineLarge(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansHeadlineLarge;

  const factory AppText.cofosansHeadlineMedium(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansHeadlineMedium;

  const factory AppText.cofosansHeadlineSmall(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansHeadlineSmall;

  const factory AppText.cofosansTitleLarge(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansTitleLarge;

  const factory AppText.cofosansTitleMedium(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansTitleMedium;

  const factory AppText.cofosansTitleSmall(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansTitleSmall;

  const factory AppText.cofosansLabelLarge(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansLabelLarge;

  const factory AppText.cofosansLabelMedium(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansLabelMedium;

  const factory AppText.cofosansLabelSmall(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansLabelSmall;

  const factory AppText.cofosansBodyLarge(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansBodyLarge;

  const factory AppText.cofosansBodyMedium(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansBodyMedium;

  const factory AppText.cofosansBodySmall(
    String text, {
    TextStyle style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool uppercase,
    TextDecoration? decoration,
    Color? decorationColor,
    Color? color,
    bool? softWrap,
    List<BoxShadow> shadows,
  }) = _AppText$CofosansBodySmall;

  @override
  State<AppText> createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {
  late String text;
  late TextStyle style;
  late TextAlign? textAlign;
  late TextOverflow? overflow;
  late int? maxLines;
  late bool uppercase;
  late TextDecoration? decoration;
  late Color? decorationColor;
  late Color? color;
  late bool? softWrap;
  late List<BoxShadow> shadows;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant AppText oldWidget) {
    if (oldWidget.text != widget.text ||
        oldWidget.style != widget.style ||
        oldWidget.textAlign != widget.textAlign ||
        oldWidget.overflow != widget.overflow ||
        oldWidget.maxLines != widget.maxLines ||
        oldWidget.uppercase != widget.uppercase ||
        oldWidget.decoration != widget.decoration ||
        oldWidget.decorationColor != widget.decorationColor ||
        oldWidget.color != widget.color ||
        oldWidget.softWrap != widget.softWrap ||
        oldWidget.shadows != widget.shadows) {
      _init();
      super.didUpdateWidget(oldWidget);
    }
  }

  void _init() {
    text = widget.text;
    style = widget.style;
    textAlign = widget.textAlign;
    overflow = widget.overflow;
    maxLines = widget.maxLines;
    uppercase = widget.uppercase;
    decoration = widget.decoration;
    decorationColor =
        widget.decoration != null && widget.decorationColor == null
            ? widget.color
            : widget.decorationColor;
    color = widget.color;
    softWrap = widget.softWrap;
    shadows = widget.shadows;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        decoration: decoration,
        decorationColor: decorationColor,
        color: color,
        shadows: shadows,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
