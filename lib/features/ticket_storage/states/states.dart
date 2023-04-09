import 'package:flutter/material.dart';

import '../models/status.dart';
import '../models/ticket.dart';
import '../services/download.dart';

class States extends ChangeNotifier {
  final service = Download();
  List<Ticket> ticketList = [];
  Status currentStatus = Status.wait;

  void addTicket(Ticket ticket) {
    ticketList.add(ticket);
    notifyListeners();
  }

  void removeTicket(Ticket ticket) {
    ticketList.remove(ticket);
    notifyListeners();
  }

  void download(int id, String url, String filename) {
    // final Ticket currentTicket =
    //     ticketList.where((element) => element.id == id).toList().first;
    ticketList.where((element) => element.id == id).toList().first.status =
        Status.loading;
    service.download(url, filename).then((value) {
      ticketList.where((element) => element.id == id).toList().first.status =
          Status.done;
      notifyListeners();
    });
    notifyListeners();
  }
}
