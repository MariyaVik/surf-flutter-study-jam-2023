import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'states/states.dart';
import 'ui/bottom_content.dart';
import 'ui/ticket_card.dart';

class TicketStoragePage extends StatelessWidget {
  const TicketStoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хранение билетов'),
      ),
      body: Consumer<States>(
        builder: (context, state, _) => state.ticketList.isEmpty
            ? const Center(child: Text('Здесь пока ничего нет'))
            : ListView.builder(
                itemCount: state.ticketList.length,
                itemBuilder: (context, index) {
                  return TicketCard(ticket: state.ticketList[index]);
                }),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(12),
                            height: 4,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          const Expanded(child: BottomSheetContent()),
                        ],
                      ),
                    ),
                  );
                });
          },
          label: const Text('Добавить')),
    );
  }
}
