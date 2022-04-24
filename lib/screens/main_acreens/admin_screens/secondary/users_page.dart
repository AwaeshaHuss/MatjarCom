import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:matjarcom/globals.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);
  static String id = 'UsersPage';
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection(kUserInfoCollectionKey)
        .snapshots();
    return Material(
      child: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.connectionState != ConnectionState.waiting) {
            return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(data[kFullNameKey]),
                  subtitle: Text(data[kUserEmailKey]),
                  trailing: Text(data[kPasswordKey]),
                ),
              );
            }).toList());
          }
          ;
          return Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
