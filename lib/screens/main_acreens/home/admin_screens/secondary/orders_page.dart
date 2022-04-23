import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);
  static String id = 'OrdersPage';
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.blue,
      child: Center(
        child: Text('This Page Is Filled With Firebase Orders List'),
      ),
    ));
  }
}
