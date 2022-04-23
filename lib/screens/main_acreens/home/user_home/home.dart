import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:matjarcom/general_functions.dart';
import 'package:matjarcom/screens/main_acreens/home/user_home/home_screen.dart';
import 'package:matjarcom/screens/main_acreens/home/user_home/no_connection.dart';

class Home extends StatefulWidget {
  static String id = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              ? HomeScreen()
              : NoConnection();
        }
        return Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
