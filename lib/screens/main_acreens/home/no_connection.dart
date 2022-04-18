import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/no_connection.gif',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Text(
                  tr('Please Check Internet Connection'),
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
