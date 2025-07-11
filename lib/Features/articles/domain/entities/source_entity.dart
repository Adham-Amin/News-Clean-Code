import 'package:hive_flutter/hive_flutter.dart';
part 'source_entity.g.dart';

@HiveType(typeId: 0)
class SourceEntity {
  @HiveField(0)
  final String sourceId;

  @HiveField(1)
  final String sourceName;

  const SourceEntity({
    required this.sourceId,
    required this.sourceName,
  });
}