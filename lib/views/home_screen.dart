import 'package:flutter/material.dart';

import 'data_view_screen.dart';
import 'nfc_tap_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('NFC Data Store'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.tap_and_play,
                  ),
                  text: 'Tap NFC',
                ),
                Tab(
                  icon: Icon(
                    Icons.list,
                  ),
                  text: 'View Data',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            NFCTapScreen(),
            DataViewScreen(),
          ]),
        ),
      ),
    );
  }
}
