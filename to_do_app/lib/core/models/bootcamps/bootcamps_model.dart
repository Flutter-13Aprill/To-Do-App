import 'package:dart_mappable/dart_mappable.dart';


part 'bootcamps_model.mapper.dart';

@MappableClass()
class BootcampsModel with BootcampsModelMappable {
  final int id;
  final String name;
  @MappableField(key: 'created_at')
  final String createdAt;

  BootcampsModel({
    required this.id,
    required this.name,
    required this.createdAt,
  });
}
