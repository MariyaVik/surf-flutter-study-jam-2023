import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../models/category.dart';
import '../models/status.dart';
import '../models/ticket.dart';
import '../states/states.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  const TicketCard({
    required this.ticket,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(ticket.category == Category.plane
              ? Icons.airplane_ticket_outlined
              : Icons.bus_alert_outlined),
          const SizedBox(width: 16),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    if (ticket.status == Status.done) {
                      OpenFilex.open(
                          "/storage/emulated/0/Download/${ticket.name}.pdf");
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket.name,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: LinearProgressIndicator(
                            value: ticket.status == Status.wait
                                ? 0
                                : ticket.status == Status.loading
                                    ? 0.23
                                    : 1), // хардкод, ИЗМЕНИТЬ
                      ),
                      Text(ticket.status == Status.wait
                          ? 'Ожидание загрузки'
                          : ticket.status == Status.loading
                              ? 'Загружается'
                              : 'Файл загружен')
                    ],
                  ))),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              ticket.status == Status.wait
                  ? Icons.cloud_download_outlined
                  : ticket.status == Status.loading
                      ? Icons.pause_circle_outline
                      : Icons.cloud_done,
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
