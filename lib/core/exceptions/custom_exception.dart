class CustomException implements Exception {
  final String title;
  final String? subtitle;

  const CustomException({required this.title, this.subtitle});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomException &&
        title == other.title &&
        subtitle == other.subtitle;
  }

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode;
}
