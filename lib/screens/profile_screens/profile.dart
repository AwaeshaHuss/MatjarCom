import 'package:cool_alert/cool_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:matjarcom/general_functions.dart';
import 'package:matjarcom/widgets/custom_text_field.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  static String id = 'Profile';
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: _buildBody(size, context, appBarHeight),
    );
  }

  Widget _buildBody(Size size, BuildContext context, appBarHeight) {
    return Stack(
      children: [
        ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.person,
                    size: 36,
                  ),
                  Text(
                    'Full Name'.tr(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: size.width * .3,
                  ),
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(context, 'Edit Profile Name'.tr(),
                          _nameController, () {});
                    },
                    child: const Icon(
                      Icons.edit,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .1,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.email,
                    size: 36,
                  ),
                  Text(
                    'Email Address'.tr(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: size.width * .3,
                  ),
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(context, 'Edit Email Address'.tr(),
                          _emailController, () {});
                    },
                    child: const Icon(
                      Icons.edit,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .1,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.phone,
                    size: 36,
                  ),
                  Text(
                    'Phone Number'.tr(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: size.width * .3,
                  ),
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(context, 'Edit Phone Number'.tr(),
                          _phoneController, () {});
                    },
                    child: const Icon(
                      Icons.edit,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .1,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.password,
                    size: 36,
                  ),
                  Text(
                    'Password'.tr(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: size.width * .3,
                  ),
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(context, 'Edit Password'.tr(),
                          _phoneController, () {});
                    },
                    child: const Icon(
                      Icons.edit,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .2,
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () async {
              Navigator.pop(context);
            },
            child: Container(
              height: size.height * .1,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Text(
                'DONE'.tr(),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'My Profile'.tr().toUpperCase(),
        style: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}
