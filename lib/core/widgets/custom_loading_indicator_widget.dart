part of 'widgets.dart';

class CustomLoadingIndicatorWidget extends StatelessWidget {
  const CustomLoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
