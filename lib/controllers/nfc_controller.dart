import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nfc_app/models/nfc_data_models.dart';
import 'package:nfc_app/services/location_service.dart';
import 'package:nfc_app/services/nfc_services.dart';

import '../services/firebase_services.dart';

class NFCController {
  final NFCService nfcService = NFCService();
  final LocationService locationService = LocationService();
  final FireBaseService fireBaseService = FireBaseService();

  Future<void> handleNfcTap() async {
    try {
      String? cardDetails = await nfcService.readNfcTag();
      if (cardDetails != null) {
        Map<String, double> location =
            await locationService.getCurrentLocation();
        NFCdata data = NFCdata(
            cardDetails: cardDetails,
            timeStamp: DateTime.now(),
            location: location);
        await fireBaseService.savedNFCData(data);
        print('NFC Data Saved Successfully');
      } else {
        print('no NFC Found');
      }
    } catch (e) {
      print('Error handling NFC tap: $e');
    }
  }

  Stream<QuerySnapshot> getNFCDataStream() {
    return fireBaseService.getNFCData();
  }
}
