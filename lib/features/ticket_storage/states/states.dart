import 'package:flutter/material.dart';

import '../domain/models/filter.dart';
import '../domain/models/status.dart';
import '../domain/models/ticket.dart';
import '../services/download.dart';

class States extends ChangeNotifier {
  final service = Download();
  List<Ticket> ticketList = [];
  List filtred = [];

  Filter currentFilter = Filter.all;
  String message = 'Здесь пока ничего нет';

  void addTicket(Ticket ticket) {
    ticketList.add(ticket);
    filtering();
    notifyListeners();
  }

  void download(int id, String url, String filename) {
    ticketList.where((element) => element.id == id).toList().first.status =
        Status.loading;
    service.download(url, filename).then((value) {
      ticketList.where((element) => element.id == id).toList().first.status =
          Status.done;
      filtering();
      notifyListeners();
    });
    notifyListeners();
  }

  void filtering() {
    switch (currentFilter) {
      case Filter.all:
        filtred = ticketList;
        message = filtred.isEmpty ? 'Здесь пока ничего нет' : '';
        break;
      case Filter.done:
        filtred = ticketList
            .where((element) => element.status == Status.done)
            .toList();
        message = filtred.isEmpty ? 'У вас нет загруженных билетов' : '';
        break;
      case Filter.wait:
        filtred = ticketList
            .where((element) => element.status == Status.wait)
            .toList();
        message = filtred.isEmpty ? 'Вы загрузили все билеты' : '';
        break;
      default:
        filtred = ticketList;
        message = filtred.isEmpty ? 'Здесь пока ничего нет' : '';
    }

    notifyListeners();
  }
}
