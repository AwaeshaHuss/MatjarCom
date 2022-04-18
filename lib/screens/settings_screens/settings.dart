import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matjarcom/providers/theme.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);
  static String id = 'Settings';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool lFlag = false;
  bool tFlag = false;
  int _localeCode = 1;

  saveLocale(BuildContext context) async {
    if (_localeCode == 1) {
      try {
        await EasyLocalization.of(context)?.setLocale(const Locale('en', 'US'));
        _localeCode = 2;
      } catch (err) {
        debugPrint('$err');
      }
    } else {
      try {
        await EasyLocalization.of(context)?.setLocale(const Locale('ar', 'JO'));
        _localeCode = 1;
      } catch (err) {
        debugPrint('$err');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      setState(() {});
    });
    final size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(
      builder: (context, ThemeProvider themeProvider, child) => Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(size, themeProvider),
      ),
    );
  }

  ListView _buildBody(size, theme) => ListView(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(top: size.height * .02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('Change App Language(Ar/En)'),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Icon(Icons.language),
                    Switch.adaptive(
                        value: lFlag,
                        onChanged: (value) {
                          saveLocale(context);
                          lFlag = value;
                        })
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(top: size.height * .02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('Change App Theme(Light/Dark)'),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Icon(Icons.dark_mode),
                    Switch.adaptive(
                        value: tFlag,
                        onChanged: (value) {
                          theme.isDarkThemeOn = value;
                          tFlag = value;
                        })
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // remove account
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.only(top: size.height * .02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr('Remove Your Account'),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.remove),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: .6,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.only(top: size.height * .02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr('App Version: 1.0.0(Beta)'),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.info)
                ],
              ),
            ),
          ),
        ],
      );

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(tr('Settings').toUpperCase(),
          style: GoogleFonts.playfairDisplay(
            textStyle: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800),
          )),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.adaptive.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}
