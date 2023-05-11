import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/models/filter.dart';
import '../states/states.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final stateProvider = context.read<States>();
    return PopupMenuButton(
      icon: const Icon(Icons.filter_alt),
      itemBuilder: (BuildContext context) => <PopupMenuItem<Filter>>[
        PopupMenuItem(
          value: Filter.all,
          child: const Text('Все'),
          onTap: () {
            if (stateProvider.currentFilter != Filter.all) {
              stateProvider.currentFilter = Filter.all;
              stateProvider.filtering();
            }
          },
        ),
        PopupMenuItem(
          value: Filter.done,
          child: const Text('Загруженные'),
          onTap: () {
            if (stateProvider.currentFilter != Filter.done) {
              stateProvider.currentFilter = Filter.done;
              stateProvider.filtering();
            }
          },
        ),
        PopupMenuItem(
          value: Filter.wait,
          child: const Text('Незагруженные'),
          onTap: () {
            if (stateProvider.currentFilter != Filter.wait) {
              stateProvider.currentFilter = Filter.wait;
              stateProvider.filtering();
            }
          },
        ),
      ],
    );
  }
}
