import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:matjarcom/globals.dart';
import 'package:matjarcom/screens/main_acreens/home/admin_screens/home/home.dart';
import 'package:matjarcom/screens/profile_screens/register.dart';
import 'package:matjarcom/screens/main_acreens/home/user_home/home.dart';
import 'package:matjarcom/services/auth.dart';
import 'package:matjarcom/widgets/custom_text_field.dart';

class Login extends StatelessWidget {
  static String id = 'Login';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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

  // add the resetPassword

  Widget _buildBody(Size size, BuildContext context) {
    return ListView(
      children: [
        Container(
          width: size.width,
          height: size.width * .22,
          margin:
              EdgeInsets.only(top: size.height * .1, bottom: size.height * .1),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Image.asset(
              'assets/images/store.png',
              fit: BoxFit.fill,
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
          controller: _passwordController,
          maxLength: 16,
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
              // Handle Login Logic
              if (_emailController.text.isNotEmpty &&
                  _passwordController.text.isNotEmpty &&
                  _emailController.text.contains('@') &&
                  _emailController.text.contains('.') &&
                  _emailController.text != kAdminEmail &&
                  _passwordController.text != kAdminPassword) {
                await Auth().signIn(_emailController.text.trim(),
                    _passwordController.text.trim());
                Navigator.pushNamed(context, Home.id);
              } else if (_emailController.text == kAdminEmail &&
                  _passwordController.text == kAdminPassword) {
                // Navigate to AdminHome
                Navigator.pushNamed(context, AdminHome.id);
              }
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Please Enter Valid Entrires'.tr(),
                      style: TextStyle(fontWeight: FontWeight.bold))));
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
                    'LOGIN'.tr(),
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
          height: size.height * .04,
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
                    'Don\'t have account? '.tr(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Register.id);
                    },
                    child: Text(
                      'Create One Now'.tr(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Forget Your Password? '.tr(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.white.withOpacity(.6),
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                width: size.width,
                                height: size.height * .7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: size.height * .08),
                                      child: Text(
                                        'Forget Your Password? '.tr(),
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    CustomTextField(
                                      controller: _emailController,
                                      maxLength: 24,
                                      hint: 'Enter your email'.tr(),
                                      isFilled: true,
                                      inputType: TextInputType.visiblePassword,
                                      isTextSecured: false,
                                      fillColor: Colors.white,
                                      hintStyle: const TextStyle(
                                          color: Colors.black38),
                                      icon: Icons.lock,
                                      iconColor: Colors.black38,
                                      spaces: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 12),
                                    ),
                                    TextButton(
                                        onPressed: () async {
                                          if (_emailController.text
                                                  .contains('@') &&
                                              _emailController.text
                                                  .contains('.')) {
                                            await Auth().resetPassword(
                                                _emailController.text.trim());
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0))),
                                          width: size.width * .8,
                                          alignment: Alignment.center,
                                          height: size.height * .04,
                                          child: Text(
                                            'Send Password Reset Email'.tr(),
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ))
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text(
                        'Reset It Now'.tr(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      )),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  const Icon(Icons.restore),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
