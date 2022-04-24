import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:matjarcom/globals.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage({Key? key}) : super(key: key);
  static String id = 'OrdersPage';
  final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
      .collection(kUserAddressCollectionKey)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _ordersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData &&
            !snapshot.hasError &&
            snapshot.connectionState != ConnectionState.waiting) {
          return Material(
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(data[kCityKey]),
                    subtitle: Text(data[kRegionKey]),
                    trailing: Text(data[kStNameKey]),
                  ),
                );
              }).toList(),
            ),
          );
        }
        return Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
