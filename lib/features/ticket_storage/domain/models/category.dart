import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 3)
enum Category {
  @HiveField(0)
  plane,
  @HiveField(1)
  bus,
}
