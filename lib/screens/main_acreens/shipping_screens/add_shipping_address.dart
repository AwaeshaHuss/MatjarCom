import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matjarcom/general_functions.dart';
import 'package:matjarcom/globals.dart';
import 'package:matjarcom/widgets/custom_text_field.dart';

class AddShippingAddress extends StatefulWidget {
  AddShippingAddress({Key? key}) : super(key: key);
  static String id = 'AddShippingAddress';

  @override
  State<AddShippingAddress> createState() => _AddShippingAddressState();
}

class _AddShippingAddressState extends State<AddShippingAddress> {
  final _nameController = TextEditingController();

  final _cityController = TextEditingController();

  final _regionController = TextEditingController();

  final _stController = TextEditingController();

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height:
                calcCartListViewHeight(size, statusBarHeight, appBarHeight) -
                    size.height * .11,
            child: ListView(
              physics: const ScrollPhysics(),
              children: [
                CustomTextField(
                  controller: _nameController,
                  maxLength: 9,
                  hint: 'Full Name'.tr(),
                  isFilled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.black38),
                  iconColor: Colors.black38,
                  spaces:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                CustomTextField(
                  controller: _cityController,
                  maxLength: 11,
                  hint: 'City'.tr(),
                  isFilled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.black38),
                  iconColor: Colors.black38,
                  spaces:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                CustomTextField(
                  controller: _regionController,
                  maxLength: 11,
                  hint: 'Region'.tr(),
                  isFilled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.black38),
                  iconColor: Colors.black38,
                  spaces:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                CustomTextField(
                  controller: _stController,
                  maxLength: 11,
                  hint: 'St Name'.tr(),
                  isFilled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.black38),
                  iconColor: Colors.black38,
                  spaces:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                CustomTextField(
                  controller: _phoneController,
                  maxLength: 15,
                  inputType: TextInputType.number,
                  hint: 'Phone Number'.tr(),
                  isFilled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.black38),
                  iconColor: Colors.black38,
                  spaces:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          GestureDetector(
            onTap: () async {
              // Add these feilds strings to firebase
              await setShippingName(
                _nameController.text.trim(),
              );
              await setShippingCity(_cityController.text.trim());
              await setShippingRegion(_regionController.text.trim());
              await setShippingStName(_stController.text.trim());
              await setShippingPhone(_phoneController.text.trim());
              Navigator.pop(context);
            },
            child: Container(
              height: size.height * .1,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Text('Continue'.tr().toUpperCase(),
                  style: GoogleFonts.laila(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
