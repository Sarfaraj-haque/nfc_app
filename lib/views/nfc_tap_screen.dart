import 'package:flutter/material.dart';
import 'package:nfc_app/controllers/nfc_controller.dart';

class NFCTapScreen extends StatelessWidget {
  NFCTapScreen({super.key});

  final NFCController nfcController = NFCController();

  @override
  Widget build(context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await nfcController.handleNfcTap();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('NFC Data Saved'),)
          );

        },
        child: Text('Tap NFC'),
      ),
    );
  }
}
