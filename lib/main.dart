import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/ticket_storage_page.dart';

import 'features/ticket_storage/services/download.dart';
import 'features/ticket_storage/states/states.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<States>(create: (context) => States()),
        ChangeNotifierProvider<Download>(create: (context) => Download()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeLight,
        home: const TicketStoragePage(),
      ),
    );
  }
}
