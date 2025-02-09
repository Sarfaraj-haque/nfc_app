import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nfc_app/controllers/nfc_controller.dart';

class DataViewScreen extends StatelessWidget {
  DataViewScreen({super.key});

  final NFCController dataViewController = NFCController();

  @override
  Widget build(context) {
    return StreamBuilder(
      stream: dataViewController.getNFCDataStream(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapShot.hasError) {
          return Center(
            child: Text('Error: ${snapShot.error}'),
          );
        }
        final data = snapShot.data!.docs;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index].data() as Map<String, dynamic>;
            return ListTile(
              title: Text(item['cardDetails']),
              subtitle: Text(item['timeStamp']),
              trailing: Text(item['location']),
            );
          },
        );
      },
    );
  }
}
