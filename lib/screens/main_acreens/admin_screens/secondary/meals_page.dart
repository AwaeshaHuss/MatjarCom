import 'package:flutter/material.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({Key? key}) : super(key: key);
  static String id = 'MealsPage';
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'This Page Contains: Add Meal, Edit Meal and Remove Meal GridView',
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }
}
