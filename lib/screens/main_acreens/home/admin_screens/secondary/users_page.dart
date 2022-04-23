import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);
  static String id = 'UsersPage';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.blue,
        child: Center(child: Text('Fill This Page With Firebase Users List')),
      ),
    );
  }
}
