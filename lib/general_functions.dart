import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:matjarcom/globals.dart';
import 'package:matjarcom/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this method is for showing the alert dialog on backButton pressed here on home page
Future<dynamic> showExitDialog(BuildContext context) {
  return CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      backgroundColor: Colors.brown.withOpacity(0.25),
      text: "Do you want to exit",
      showCancelBtn: true,
      onConfirmBtnTap: () {
        SystemNavigator.pop();
      },
      onCancelBtnTap: () {
        Navigator.of(context).pop(false);
      });
}

Future<dynamic> showCustomCoolDialog(
    context, type, text, content, isCancelable, action) {
  return CoolAlert.show(
      context: context,
      type: type,
      backgroundColor: Colors.black45,
      text: text,
      widget: content,
      showCancelBtn: isCancelable,
      onCancelBtnTap: () {
        Navigator.pop(context);
      },
      onConfirmBtnTap: action);
}

showAlertDialog(BuildContext context, title, controller, action) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Continue"),
    onPressed: action,
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: CustomTextField(
      controller: controller,
      maxLength: 9,
      hint: 'Full Name',
      isFilled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: Colors.black38),
      iconColor: Colors.black38,
      spaces: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

setUserLogged() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(kISUSERLOGGEDIN, true);
}

Future<bool> getUserLogged() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(kISUSERLOGGEDIN)!;
}

deleteUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(kISUSERLOGGEDIN);
}

String calcSubTotalPrice(index) {
  int subPrice = int.parse(products[index].price ?? '1');
  int quantity = products[index].quantity ?? 1;
  return '${subPrice * quantity}';
}

//subTotalPrice[i] + subTotalPrice[i+1]
String calcTotalPrice() {
  int total = 0;
  for (int index = 0; index < products.length; index++) {
    int subTotalPerItem = int.parse(calcSubTotalPrice(index));
    total += subTotalPerItem;
  }
  return total.toString();
}

double calcCartListViewHeight(Size size, statusBarHeight, appBarHeight) {
  return size.height - statusBarHeight - appBarHeight - (size.height * .09);
}

RelativeRect calcMenuItemPosition(dx, dy, Size size) {
  double dxLeft = size.width - dx;
  double dyBottom = size.height - dy + 20;
  return RelativeRect.fromLTRB(dx, dy, dxLeft, dyBottom);
}

// disabled
Future<void> setShippingName(name) async {
  SharedPreferences shared = await SharedPreferences.getInstance();
  shared.setString(kFullNameKey, name);
}

// disabled
Future<void> setShippingCity(cty) async {
  SharedPreferences shared = await SharedPreferences.getInstance();
  shared.setString(kCityKey, cty);
}

// disabled
Future<void> setShippingRegion(rgn) async {
  SharedPreferences shared = await SharedPreferences.getInstance();
  shared.setString(kRegionKey, rgn);
}

// disabled
Future<void> setShippingStName(name) async {
  SharedPreferences shared = await SharedPreferences.getInstance();
  shared.setString(kStNameKey, name);
}

// disabled
Future<void> setShippingPhone(phon) async {
  SharedPreferences shared = await SharedPreferences.getInstance();
  shared.setString(kPhoneKey, phon);
}

Future<void> setIsShippingAddressFilled(value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool(kShippingAddressKey, value);
}

Future<bool?> getIsShippingAddressFilled() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool(kShippingAddressKey);
}

setTheme(bool value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool(kThemeKey, value);
}

getTheme() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool(kThemeKey) ?? false;
}

Future getCurrentPosition(context) async {
  bool isLocationServicesEnabeld = false;
  LocationPermission locationPermission;
  Position? currentPosition;
  isLocationServicesEnabeld = await Geolocator.isLocationServiceEnabled();
  if (!isLocationServicesEnabeld) {
    showCustomCoolDialog(context, CoolAlertType.warning, 'Title',
        Text('The App Needs Location Permission'), true, () {
      Navigator.pop(context);
    });
  }

  locationPermission = await Geolocator.checkPermission();
  if (locationPermission == LocationPermission.denied) {
    locationPermission = await Geolocator.requestPermission();
  } else if (locationPermission == LocationPermission.always ||
      locationPermission == LocationPermission.whileInUse) {
    currentPosition = await getLatLong();
  }
  return currentPosition;
}

Future<Position> getLatLong() async {
  return await Geolocator.getCurrentPosition().then((value) => value);
}

Future<ConnectivityResult> getConnectionStatus() async {
  return await (Connectivity().checkConnectivity());
}
