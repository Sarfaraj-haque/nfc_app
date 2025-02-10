import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nfc_app/models/nfc_data_models.dart';

class FireBaseService {
  final CollectionReference _nfcCollection =
      FirebaseFirestore.instance.collection('nfc_data');

  Future<void> savedNFCData(NFCdata nfcData) async {
    try {
      await _nfcCollection.add(nfcData.toMap());
    } catch (e) {
      print('Error saving NFC data: $e');
      throw e;
    }
  }

  Stream<QuerySnapshot> getNFCData() {
    try {
      return _nfcCollection.snapshots();
    } catch (e) {
      print('Error getting NFC data: $e');
      throw e;
    }
  }
}
