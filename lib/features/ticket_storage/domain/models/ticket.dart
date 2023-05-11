import 'package:hive/hive.dart';

import 'category.dart';
import 'status.dart';

part 'ticket.g.dart';

@HiveType(typeId: 1)
class Ticket {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final String name;
  @HiveField(3)
  Status status;
  @HiveField(4)
  final Category category;
  Ticket(
      {required this.name,
      required this.category,
      this.status = Status.wait,
      required this.url,
      required this.id});
}
