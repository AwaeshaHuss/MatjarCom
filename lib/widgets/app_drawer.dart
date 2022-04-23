import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matjarcom/screens/profile_screens/login.dart';
import 'package:matjarcom/screens/profile_screens/profile.dart';
import 'package:matjarcom/screens/main_acreens/home/user_home/home.dart';
import 'package:matjarcom/screens/settings_screens/settings.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .45,
      child: Drawer(
        backgroundColor: Colors.white.withOpacity(.65),
        child: Padding(
          padding: EdgeInsets.only(top: size.height * .075),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white.withOpacity(.65)),
                accountName: Text(
                  'developer'.tr(),
                  style: GoogleFonts.playfairDisplay(
                      textStyle: Theme.of(context).textTheme.titleLarge),
                ),
                accountEmail: Text(
                  'dev@app.com'.tr(),
                  style: GoogleFonts.playfairDisplay(
                      textStyle: Theme.of(context).textTheme.bodyText1),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.black38,
                  child: Image.asset(
                    'assets/images/profile.png',
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .07,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Home.id);
                },
                child: ListTile(
                  leading: Text('HOME'.tr(),
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )),
                  trailing: const Icon(
                    Icons.home,
                    size: 23,
                  ),
                  dense: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, Login.id),
                child: ListTile(
                  leading: Text('LOGIN'.tr(),
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )),
                  trailing: const Icon(
                    Icons.login,
                    size: 23,
                  ),
                  dense: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, Profile.id),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: Text('PROEILE'.tr(),
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )),
                  trailing: const Icon(Icons.person),
                  dense: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Settings.id);
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: Text('SETTINGS'.tr(),
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )),
                  trailing: const Icon(
                    Icons.settings,
                    size: 23,
                  ),
                  dense: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: Text('SHARE APP'.tr(),
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )),
                  trailing: const Icon(
                    Icons.share,
                    size: 23,
                  ),
                  dense: true,
                ),
              ),
              SizedBox(
                height: size.height * .1,
              ),
              Container(
                color: Colors.white38,
                width: size.width,
                padding: const EdgeInsets.only(top: 20),
                height: size.height * .12,
                child: Text(currentDate(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      textStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w800),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  String currentDate() {
    var now = DateTime.now();
    var formatter = DateTime(now.year, now.month, now.day);
    return formatter.toString();
  }
}
