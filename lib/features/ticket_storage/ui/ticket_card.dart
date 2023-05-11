import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../domain/models/category.dart';
import '../domain/models/status.dart';
import '../domain/models/ticket.dart';
import '../services/download.dart';
import '../states/states.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  const TicketCard({
    required this.ticket,
    super.key,
  });

  IconData getLoadIcon() {
    return ticket.status == Status.wait
        ? Icons.cloud_download_outlined
        : ticket.status == Status.loading
            ? Icons.pause_circle_outline
            : Icons.cloud_done;
  }

  String getLoadText() {
    return ticket.status == Status.wait
        ? 'Ожидание загрузки'
        : ticket.status == Status.loading
            ? 'Загружается'
            : 'Файл загружен';
  }

  IconData getCategoryIcon() {
    return ticket.category == Category.plane
        ? Icons.airplane_ticket_outlined
        : Icons.bus_alert_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(getCategoryIcon()),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticket.name,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Consumer<Download>(builder: (context, download, _) {
                  return LinearProgressIndicator(
                      value: ticket.status == Status.wait
                          ? 0
                          : ticket.status == Status.loading
                              ? download.received / download.total // исправить
                              : 1);
                }), // хардкод, ИЗМЕНИТЬ
              ),
              Text(getLoadText())
            ],
          )),
          if (ticket.status == Status.done)
            IconButton(
                onPressed: () {
                  OpenFilex.open(
                      "/storage/emulated/0/Download/${ticket.name}.pdf");
                },
                icon: const Icon(Icons.remove_red_eye_outlined)),
          IconButton(
            icon: Icon(
              getLoadIcon(),
              color: AppColor.mainColor,
            ),
            onPressed: () {
              context
                  .read<States>()
                  .download(ticket.id, ticket.url, '${ticket.name}.pdf');
            },
          ),
        ],
      ),
    );
  }
}
