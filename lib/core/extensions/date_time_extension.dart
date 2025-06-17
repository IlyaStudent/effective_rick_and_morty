part of 'extensions.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate => '${_pad(day)}.${_pad(month)}.$year';

  String _pad(int number) => number.toString().padLeft(2, '0');
}
