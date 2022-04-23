import 'dart:ui' as ui;
import 'package:cool_alert/cool_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matjarcom/general_functions.dart';
import 'package:matjarcom/globals.dart';
import 'package:matjarcom/screens/main_acreens/shipping_screens/shipping_address.dart';
import 'package:matjarcom/screens/main_acreens/home/user_home/home.dart';

class CheckOut extends StatelessWidget {
  CheckOut({Key? key}) : super(key: key);
  static String id = 'CheckOut';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Stack _buildBody(context) {
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        _buildPageRowsListView(_size, context),
        _buildBottomButton(_size),
      ],
    );
  }

  Padding _buildPageRowsListView(Size _size, context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () {
              // Navigate 2 Add Shipping Address Screen
              Navigator.pushNamed(context, ShippingAddress.id);
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr('Shipping Address'),
                            style: GoogleFonts.oswald(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(tr('Add New Shipping Address'),
                            style: GoogleFonts.oswald(
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )),
                      ]),
                  IconButton(
                      onPressed: () {},
                      icon: Directionality(
                          textDirection: ui.TextDirection.rtl,
                          child: Icon(Icons.adaptive.arrow_back))),
                ],
              ),
            ),
          ),
          SizedBox(
            height: _size.height * .02,
          ),
          //Shhipping Address Row End
          Opacity(
            opacity: .5,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr('Shipping Method'),
                          style: GoogleFonts.oswald(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(tr('Select Shpping Method'),
                          style: GoogleFonts.oswald(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Directionality(
                          textDirection: ui.TextDirection.rtl,
                          child: Icon(Icons.adaptive.arrow_back))),
                ],
              ),
            ),
          ),
          // Shipping Method Row End
          SizedBox(
            height: _size.height * .02,
          ),
          Opacity(
            opacity: .5,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr('Payment Method'),
                          style: GoogleFonts.oswald(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(tr('Select Payment Method'),
                          style: GoogleFonts.oswald(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Directionality(
                          textDirection: ui.TextDirection.rtl,
                          child: Icon(Icons.adaptive.arrow_back))),
                ],
              ),
            ),
          ),
          SizedBox(
            height: _size.height * .02,
          ),
          // Payment Method Row End
          _buildItemsListView(_size),
        ],
      ),
    );
  }

  Container _buildItemsListView(Size _size) {
    return Container(
      color: Colors.white,
      height: _size.height * .25,
      child: SizedBox(
        height: _size.height * .18,
        width: _size.width * .8,
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('x${products[index].quantity}',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: _size.height * .01,
                          ),
                          Text('${products[index].title}',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: _size.height * .01,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('\$ ${products[index].price}',
                            style: GoogleFonts.oswald(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Positioned _buildBottomButton(Size _size) {
    return Positioned(
        bottom: 0,
        child: Builder(
          builder: (context) => ButtonTheme(
            minWidth: _size.width,
            height: _size.height * .1,
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.black,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              onPressed: () async {
                // don't open the BottomSheet unless the user filled the shipping address
                await getIsShippingAddressFilled() == true
                    ? showModalBottomSheet(
                        elevation: 0,
                        barrierColor: Colors.white.withOpacity(.7),
                        backgroundColor: Colors.white.withOpacity(.7),
                        context: context,
                        builder: (context) {
                          return Column(
                            children: [
                              Image.asset(
                                'assets/images/delivery.gif',
                                fit: BoxFit.fill,
                              ),
                              Text(tr('YOUR MEAL IS ON IT\'S WAY'),
                                  style: GoogleFonts.oswald(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, Home.id, (route) => false);
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 75,
                                      color: Colors.black,
                                      child: Text(tr('DONE'),
                                          style: GoogleFonts.oswald(
                                            textStyle: const TextStyle(
                                                color: Colors.white),
                                          ))))
                            ],
                          );
                        })
                    : showCustomCoolDialog(context, CoolAlertType.warning, null,
                        Text('Please Fill Shipping Address'), true, null);
              },
              child: Text(
                tr('Place Order').toUpperCase(),
                style: GoogleFonts.laila(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(tr('CheckOut').toUpperCase(),
          style: GoogleFonts.oswald(
            textStyle: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800),
          )),
      leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(Icons.arrow_back, color: Colors.black)),
    );
  }
}
