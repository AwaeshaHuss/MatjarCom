import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:matjarcom/globals.dart';
import 'package:matjarcom/models/user.dart';
import 'package:matjarcom/screens/main_acreens/home/admin_screens/home.dart';
import 'package:matjarcom/screens/profile_screens/login.dart';
import 'package:matjarcom/screens/main_acreens/home/user_home/home.dart';
import 'package:matjarcom/services/auth.dart';
import 'package:matjarcom/widgets/custom_text_field.dart';

class Register extends StatelessWidget {
  static String id = 'Register';
  bool isUserSaved = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  CollectionReference userRef =
      FirebaseFirestore.instance.collection(kUserInfoCollectionKey);

  Future<void> addUser() {
    isUserSaved = true;
    return userRef
        .add(UserInfo(
                name: _nameController.text,
                phone: _phoneController.text,
                email: _emailController.text,
                password: _passwordController.text)
            .toJson())
        .then((value) => log('added a new user to collection: USER'))
        .catchError((error) => log("Failed to add user"))
        .whenComplete(() => log('user adding to firebase completed'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildBody(size, context),
      ),
    );
  }

  // add the reset Password

  Widget _buildBody(Size size, BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width,
              height: size.width * .22,
              margin: EdgeInsets.only(
                  top: size.height * .1, bottom: size.height * .07),
              child: Opacity(
                opacity: 0.7,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Image.asset(
                    'assets/images/store.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            //------------TextFields
            CustomTextField(
              controller: _emailController,
              maxLength: 27,
              hint: 'Enter your email'.tr(),
              isFilled: true,
              inputType: TextInputType.emailAddress,
              fillColor: Colors.white,
              hintStyle: const TextStyle(color: Colors.black38),
              icon: Icons.email,
              iconColor: Colors.black38,
              spaces: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),

            CustomTextField(
              controller: _nameController,
              hint: 'Enter your name'.tr(),
              maxLength: 13,
              isFilled: true,
              inputType: TextInputType.emailAddress,
              fillColor: Colors.white,
              hintStyle: const TextStyle(color: Colors.black38),
              icon: Icons.person,
              iconColor: Colors.black38,
              spaces: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),

            CustomTextField(
              controller: _phoneController,
              hint: 'Enter your phone'.tr(),
              maxLength: 12,
              isFilled: true,
              inputType: TextInputType.emailAddress,
              fillColor: Colors.white,
              hintStyle: const TextStyle(color: Colors.black38),
              icon: Icons.phone,
              iconColor: Colors.black38,
              spaces: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),

            CustomTextField(
              controller: _passwordController,
              maxLength: 9,
              hint: 'Enter your password'.tr(),
              isFilled: true,
              inputType: TextInputType.visiblePassword,
              isTextSecured: true,
              fillColor: Colors.white,
              hintStyle: const TextStyle(color: Colors.black38),
              icon: Icons.lock,
              iconColor: Colors.black38,
              spaces: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
            SizedBox(
              height: size.height * .04,
            ),
            //--------------------Button
            Builder(builder: (context) {
              return InkWell(
                onTap: () async {
                  if (_emailController.text == kAdminEmail &&
                      _passwordController.text == kAdminPassword &&
                      _nameController.text.isNotEmpty &&
                      _phoneController.text.isNotEmpty &&
                      isUserSaved) {
                    // Navigate to AdminHome
                    Navigator.pushNamed(context, AdminHome.id);
                  }
                  // Handle Login Logic
                  else if (_emailController.text.isNotEmpty &&
                      _nameController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty &&
                      _emailController.text.contains('@') &&
                      _emailController.text.contains('.') &&
                      _phoneController.text.isNotEmpty &&
                      isUserSaved) {
                    await Auth().signUp(_emailController.text.trim(),
                        _passwordController.text.trim());

                    Navigator.pushNamed(context, Home.id);
                  }
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                    'Please Enter Valid Entrires, or save current user'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: size.height * .06,
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.account_box,
                        color: Colors.white,
                      ),
                      Text(
                        'Register'.tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              );
            }),
            SizedBox(
              height: size.height * .02,
            ),
            TextButton(onPressed: addUser, child: Text('save current user')),
            SizedBox(
              height: size.height * .02,
            ),
            //-------------------BottomRow
            Container(
              // color: Colors.lightBlue,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Do have account? '.tr(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Login.id);
                        },
                        child: Text(
                          'LogIn Now'.tr(),
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .025,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
