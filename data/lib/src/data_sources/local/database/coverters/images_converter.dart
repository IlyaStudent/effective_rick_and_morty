part of '../database.dart';

class ImagesConverter {
  ImageEntity fromTableRow(ImagesTableData imageRow) {
    return ImageEntity(url: imageRow.url, data: imageRow.data);
  }

  ImagesTableCompanion toTableRow(ImageEntity image) {
    return ImagesTableCompanion(url: Value(image.url), data: Value(image.data));
  }
}
