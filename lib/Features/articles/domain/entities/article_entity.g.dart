// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleEntityAdapter extends TypeAdapter<ArticleEntity> {
  @override
  final int typeId = 1;

  @override
  ArticleEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleEntity(
      sourceModel: fields[6] as SourceEntity,
      titleArticle: fields[0] as String,
      descriptionArticle: fields[1] as String,
      urlArticle: fields[2] as String,
      urlToImageArticle: fields[3] as String,
      publishedAtArticle: fields[4] as String,
      contentArticle: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.titleArticle)
      ..writeByte(1)
      ..write(obj.descriptionArticle)
      ..writeByte(2)
      ..write(obj.urlArticle)
      ..writeByte(3)
      ..write(obj.urlToImageArticle)
      ..writeByte(4)
      ..write(obj.publishedAtArticle)
      ..writeByte(5)
      ..write(obj.contentArticle)
      ..writeByte(6)
      ..write(obj.sourceModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
