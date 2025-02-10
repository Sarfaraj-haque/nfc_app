import 'package:cloud_firestore/cloud_firestore.dart';

class NFCdata {
  NFCdata(
      {required this.cardDetails,
      required this.timeStamp,
      required this.location});

  final String cardDetails;
  final DateTime timeStamp;
  final Map<String, double> location;

  Map<String, dynamic> toMap() {
    return {
      'cardDetails': cardDetails,
      'timeStamp': Timestamp.fromDate(timeStamp),

      // 'timeStamp': timeStamp.toIso8601String(),
      'location': location,
    };
  }
}
