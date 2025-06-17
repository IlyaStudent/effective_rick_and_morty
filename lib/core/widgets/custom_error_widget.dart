part of 'widgets.dart';

class CustomErrorWidget extends StatelessWidget {
  final CustomException exception;
  const CustomErrorWidget({super.key, required this.exception});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 24,
        children: [
          AppText.cofosansTitleLarge(exception.title),
          if (exception.subtitle?.isNotEmpty ?? false)
            AppText.cofosansLabelMedium(exception.subtitle!),
        ],
      ),
    );
  }
}
