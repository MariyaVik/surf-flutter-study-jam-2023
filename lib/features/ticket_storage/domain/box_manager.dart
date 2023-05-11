import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'models/category.dart';
import 'models/status.dart';
import 'models/ticket.dart';

abstract class BoxName {
  static const String ticket = 'ticket';
  static const String status = 'status';
  static const String category = 'category';
}

class BoxManager {
  Box<Ticket> get ticketBox => Hive.box<Ticket>(BoxName.ticket);

  Future<Box<Ticket>> openTicketBox() async {
    return await openBox(BoxName.ticket, 1, TicketAdapter());
  }

  Future<Box<Status>> openStatusBox() async {
    return await openBox(BoxName.status, 2, StatusAdapter());
  }

  Future<Box<Category>> openCategoryBox() async {
    return await openBox(BoxName.category, 3, CategoryAdapter());
  }

  Future<Box<T>> openBox<T>(
      String boxName, int typeId, TypeAdapter<T> adapter) async {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
    return await Hive.openBox<T>(boxName);
  }

  void closeBox<T>(Box<T> box) async {
    await box.compact();
    await box.close();
  }

  // void toggleNes(Nessecary nes) {
  //   nes.complete = !nes.complete;
  //   nes.save();
  // }

  void addTicket(TextEditingController controller) {
    final int id = ticketBox.isEmpty
        ? 1
        : 1 + (ticketBox.getAt(ticketBox.length - 1)?.id ?? 1);
    final String name = controller.text.split('/').last.split('.').first;
    final ticket = Ticket(
        id: id, name: name, category: Category.plane, url: controller.text);
    ticketBox.add(ticket);
    controller.clear();
  }
}
