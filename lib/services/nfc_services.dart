import 'package:nfc_manager/nfc_manager.dart';
import 'dart:async';

class NFCService {
  Future<String?> readNfcTag() async {
    // String? cardDetails;
    Completer<String?> completer = Completer<String?>();

    try {
      await NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        completer.complete(tag.data.toString());
        // cardDetails = tag.data.toString();
        await NfcManager.instance.stopSession();
      });
    } catch (e) {
      print('Error reading NFC tag: ,$e');
      completer.completeError(e);
    }
    return completer.future;
    // return cardDetails;
  }
}
