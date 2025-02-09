import 'package:nfc_manager/nfc_manager.dart';

class NFCService {
  Future<String?> readNfcTag() async {
    String? cardDetails;
    try {
      await NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        cardDetails = tag.data.toString();
        await NfcManager.instance.stopSession();
      });
    } catch (e) {
      print('error Reading NFC tag: ,$e');
    }
    return cardDetails;
  }
}
