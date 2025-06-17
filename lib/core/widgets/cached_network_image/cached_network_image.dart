part of '../widgets.dart';

class CachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  const CachedNetworkImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<ImageCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await cubit.loadImage(imageUrl);
    });

    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<ImageCubit, ImageState>(
        builder: (context, state) {
          return state.map(
            initial: () {
              return SizedBox.shrink();
            },
            loading: () {
              return CustomLoadingIndicatorWidget();
            },
            successful: (data) {
              if (data?.isNotEmpty ?? false) {
                return Image.memory(data!);
              }
              return Icon(Icons.error);
            },
            error: (exception) {
              return Icon(Icons.error);
            },
          );
        },
      ),
    );
  }
}
