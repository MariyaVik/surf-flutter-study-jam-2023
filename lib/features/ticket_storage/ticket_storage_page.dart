import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'states/states.dart';
import 'ui/bottom_content.dart';
import 'ui/filter_button.dart';
import 'ui/ticket_card.dart';

class TicketStoragePage extends StatelessWidget {
  TicketStoragePage({Key? key}) : super(key: key);
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хранение билетов'),
        actions: const [FilterButton()],
      ),
      body: Consumer<States>(
        builder: (context, state, _) => state.filtred.isEmpty
            ? Center(child: Text(state.message))
            : ListView.builder(
                controller: _controller,
                itemCount: state.filtred.length,
                itemBuilder: (context, index) {
                  return TicketCard(ticket: state.filtred[index]);
                }),
      ),
      floatingActionButton: _controller.position.pixels ==
              _controller.position.maxScrollExtent
          ? null
          : FloatingActionButton.extended(
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
