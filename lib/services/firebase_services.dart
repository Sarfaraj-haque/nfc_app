import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nfc_app/models/nfc_data_models.dart';

class FireBaseService {
 final CollectionReference _nfcCollection =
      FirebaseFirestore.instance.collection('nfc_data');

  Future<void> savedNFCData(NFCdata nfcData) async {
    await _nfcCollection.add(nfcData.toMap());
  }
  Stream<QuerySnapshot> getNFCData() {
    return _nfcCollection.snapshots();
}
}
