part of '../entitites.dart';

class CharactersListInfoEntity {
  final int count;

  final int pages;

  final String? nextPage;

  final String? prevPage;

  const CharactersListInfoEntity({
    required this.count,
    required this.pages,
    this.nextPage,
    this.prevPage,
  });

  bool get hasReachEnd => nextPage?.isEmpty ?? true;
}
