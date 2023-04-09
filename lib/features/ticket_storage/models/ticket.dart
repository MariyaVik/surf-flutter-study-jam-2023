import 'category.dart';
import 'status.dart';

class Ticket {
  final int id;
  final String url;
  final String name;
  Status status;
  final Category category;
  Ticket(
      {required this.name,
      required this.category,
      this.status = Status.wait,
      required this.url,
      required this.id});
}
