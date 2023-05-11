import 'package:hive/hive.dart';

part 'status.g.dart';

@HiveType(typeId: 2)
enum Status {
  @HiveField(0)
  wait,
  @HiveField(1)
  loading,
  @HiveField(2)
  done,
}
