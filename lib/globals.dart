import 'package:flutter/material.dart';
import 'package:matjarcom/models/product.dart';
import 'package:matjarcom/screens/main_acreens/home/admin_screens/home/home.dart';
import 'package:matjarcom/screens/main_acreens/home/admin_screens/secondary/meals_page.dart';
import 'package:matjarcom/screens/main_acreens/home/admin_screens/secondary/orders_page.dart';
import 'package:matjarcom/screens/main_acreens/home/admin_screens/secondary/users_page.dart';
import 'package:matjarcom/screens/main_acreens/shipping_screens/add_shipping_address.dart';
import 'package:matjarcom/screens/main_acreens/home/introduction.dart';
import 'package:matjarcom/screens/profile_screens/profile.dart';
import 'package:matjarcom/screens/main_acreens/shipping_screens/shipping_address.dart';
import 'package:matjarcom/screens/main_acreens/cart_screens/cart.dart';
import 'package:matjarcom/screens/main_acreens/cart_screens/checkout.dart';
import 'package:matjarcom/screens/profile_screens/login.dart';
import 'package:matjarcom/screens/main_acreens/home/product_info.dart';
import 'package:matjarcom/screens/profile_screens/register.dart';
import 'package:matjarcom/screens/main_acreens/home/user_home/home.dart';
import 'package:matjarcom/screens/settings_screens/settings.dart';

Map<String, WidgetBuilder> routes = {
  Login.id: (context) => Login(),
  Home.id: (context) => Home(),
  Register.id: (context) => Register(),
  ProductInfo.id: (context) => ProductInfo(),
  Cart.id: (context) => Cart(),
  CheckOut.id: (context) => CheckOut(),
  ShippingAddress.id: (context) => ShippingAddress(),
  AddShippingAddress.id: (context) => AddShippingAddress(),
  Profile.id: (context) => Profile(),
  Settings.id: (context) => Settings(),
  Introduction.id: (context) => Introduction(),
  AdminHome.id: (context) => AdminHome(),
  UsersPage.id: (context) => UsersPage(),
  MealsPage.id: (context) => MealsPage(),
  OrdersPage.id: (context) => OrdersPage(),
};

final List<Product> products = [
  Product(
      title: 'Item1',
      price: '20',
      imagePath: 'assets/images/dessert1.jpeg',
      quantity: 5),
  Product(
      title: 'Item7',
      price: '18',
      imagePath: 'assets/images/meal1.jpeg',
      quantity: 3),
  Product(
      title: 'Item8',
      price: '20',
      imagePath: 'assets/images/meal2.jpeg',
      quantity: 4),
  Product(
      title: 'Item2',
      price: '30',
      imagePath: 'assets/images/dessert2.jpeg',
      quantity: 2),
  // Product(
  //     title: 'Item3',
  //     price: '27',
  //     imagePath: 'assets/images/dessert3.jpeg',
  //     quantity: 4),
  // Product(
  //     title: 'Item4',
  //     price: '33',
  //     imagePath: 'assets/images/dessert4.jpeg',
  //     quantity: 2),
  // Product(
  //     title: 'Item8',
  //     price: '20',
  //     imagePath: 'assets/images/meal2.jpeg',
  //     quantity: 4),
  // Product(
  //     title: 'Item2',
  //     price: '30',
  //     imagePath: 'assets/images/dessert2.jpeg',
  //     quantity: 2),
];

//=> Login Keys
const kAdminEmail = 'admin@admin.com';
const kAdminPassword = 'admin@admin123';
const kISUSERLOGGEDIN = 'ISUSERLOGGEDIN';

//=> UserCredentials Keys
const kFullNameKey = 'FULLNAME';
const kUserEmailKey = 'USEREMAIL';
const kCityKey = 'CITY';
const kRegionKey = 'REGION';
const kStNameKey = 'STNAME';
const kPhoneKey = 'PHONE';
const kPasswordKey = 'PASSWORD';
const kShippingAddressKey = 'SHIPPINGADDRESS';

//=> App Info Keys
const kAppName = 'MatjarCom';
const kAppDescreption = 'Where Ordering Made Simple';

// App Theme Key
const kThemeKey = 'THEMEKEY';

// Firebase Collections Keys
const kUserCollectionKey = 'USER';
const kProductCollectionKey = 'PRODUCT';
const kOrderCollectionKey = 'ORDER';
const kUserAddressCollectionKey = 'USERADDRESS';
const kUserInfoCollectionKey = 'USERINFO';

//=> App Colors Keys
const kTransperentColor = Color(0x00ffffff);
const kRedColor = Color(0xFFFE4A49);
const kBlueColor = Color(0xFF21B7CA);
const kBlueAccentColor = Color(0xFF0392CF);
const kGreenAccentColor = Color(0xFF7BC043);
