import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:matjarcom/general_functions.dart';

import 'admin_no_connection.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);
  static String id = 'AdminHome';

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {});
    });
    return FutureBuilder(
      future: getConnectionStatus(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return (snapshot.data == ConnectivityResult.wifi ||
                  snapshot.data == ConnectivityResult.mobile)
              ? AdminHome()
              : AdminNoConnection();
        }
        return Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
