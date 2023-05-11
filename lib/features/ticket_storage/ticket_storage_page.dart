import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'domain/box_manager.dart';
import 'ui/bottom_content.dart';
import 'ui/filter_button.dart';
import 'ui/ticket_card.dart';

class TicketStoragePage extends StatelessWidget {
  const TicketStoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хранение билетов'),
        actions: const [FilterButton()],
      ),
      // body: Consumer<States>(
      //   builder: (context, state, _) => state.filtred.isEmpty
      //       ? Center(child: Text(state.message))
      //       : ListView.builder(
      //           controller: _controller,
      //           itemCount: state.filtred.length,
      //           itemBuilder: (context, index) {
      //             return TicketCard(ticket: state.filtred[index]);
      //           }),
      // ),
      body: ValueListenableBuilder(
          valueListenable: BoxManager().ticketBox.listenable(),
          builder: (context, box, _) {
            if (box.isEmpty) {
              return const Center(
                child: Text('Список пуст'),
              );
            }
            return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) =>
                    TicketCard(ticket: box.getAt(index)!));
          }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                context: context,
                builder: (context) {
                  return const AddUrlBottomSheet();
                });
          },
          label: const Text('Добавить')),
    );
  }
}

class AddUrlBottomSheet extends StatelessWidget {
  const AddUrlBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            ),
            const Expanded(child: BottomSheetContent()),
          ],
        ),
      ),
    );
  }
}
