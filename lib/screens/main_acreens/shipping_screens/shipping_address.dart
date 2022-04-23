import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matjarcom/general_functions.dart';
import 'package:matjarcom/globals.dart';
import 'package:matjarcom/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShippingAddress extends StatefulWidget {
  ShippingAddress({Key? key}) : super(key: key);
  static String id = 'ShippingAddress';
  Position? position;
  List<Placemark>? placemarks;

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection(kUserAddressCollectionKey);
  Future<void> addUserAddress(city, region, st) {
    return ref
        .add(UserAddress(city: city, region: region, stName: st).toJson())
        .then((value) => log('added a new user to collection: USER'))
        .catchError((error) => log("Failed to add user"))
        .whenComplete(() => log('user adding to firebase completed'));
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      setState(() {});
    });
    final size = MediaQuery.of(context).size;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildUpperTextButton(context, size),
          _buildItemsListView(size, appBarHeight, statusBarHeight)
        ],
      ),
    );
  }

  TextButton _buildUpperTextButton(BuildContext context, Size size) {
    return TextButton(
      onPressed: () async {
        widget.position = await getCurrentPosition(context);
        widget.placemarks = await placemarkFromCoordinates(
            widget.position?.latitude ?? 0.0,
            widget.position?.longitude ?? 0.0);
        addUserAddress(widget.placemarks?[0].locality,
            widget.placemarks?[0].subLocality, widget.placemarks?[0].street);
        await setIsShippingAddressFilled(true);
        setState(() {});
        // Navigator.pushNamed(context, AddShippingAddress.id);
      },
      child: Container(
        color: Colors.white,
        width: size.width,
        height: size.height * .06,
        alignment: Alignment.center,
        child: Text(tr('+  Add New Shipping Address'),
            style: GoogleFonts.oswald(
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            )),
      ),
    );
  }

  Widget _buildItemsListView(Size _size, statusBarHeight, appBarHeight) {
    return Container(
        width: _size.width * .95,
        margin: const EdgeInsets.only(top: 20),
        height: calcCartListViewHeight(_size, statusBarHeight, appBarHeight) -
            _size.height * .64,
        color: Colors.white,
        child: ListView(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.placemarks?[0].locality ?? ''}',
                            style: GoogleFonts.oswald(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            )),
                        SizedBox(
                          height: _size.height * .01,
                        ),
                        Row(
                          children: [
                            Text('${widget.placemarks?[0].subLocality ?? ''}',
                                style: GoogleFonts.oswald(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text('${widget.placemarks?[0].street ?? ''}',
                                      style: GoogleFonts.oswald(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FutureBuilder<String>(
                                  future: _getShippingSt(),
                                  builder: (context, snapshot) {
                                    return Text(snapshot.data ?? '',
                                        style: GoogleFonts.oswald(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ));
                                  }),
                            )
                          ],
                        ),
                        SizedBox(
                          height: _size.height * .01,
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: FutureBuilder<String>(
                    //       future: _getShippingPhone(),
                    //       builder: (context, snapshot) {
                    //         return Text(snapshot.data ?? '',
                    //             style: GoogleFonts.oswald(
                    //               textStyle: const TextStyle(
                    //                   fontSize: 15,
                    //                   fontWeight: FontWeight.w600),
                    //             ));
                    //       }),
                    // ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
            ],
          ),
        ]));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(tr('Shipping Address').toUpperCase(),
            style: GoogleFonts.oswald(
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )));
  }

  Future<String> _getShippingName() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(kFullNameKey) ?? '';
  }

  Future<String> _getShippingCity() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(kCityKey) ?? '';
  }

  Future<String> _getShippingRegion() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(kRegionKey) ?? '';
  }

  Future<String> _getShippingSt() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(kStNameKey) ?? '';
  }

  Future<String> _getShippingPhone() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(kPhoneKey) ?? '';
  }
}



/*
  
  FutureBuilder<String>(
                    future: _getShippingPhone(),
                    builder: (context, snapshot) {
                      return Text(
                        widget.phone,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      );
                    }),
  
   */


/*

return Expanded(
      child:
          ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: [
        Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getShippingName().toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: _size.height * .01,
                      ),
                      Text(
                        getShippingCity().toString() +
                            '/' +
                            getShippingRegion().toString() +
                            '/' +
                            getShippingSt().toString() +
                            '/',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: _size.height * .01,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${getShippingPhone()}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      ]),
    );

 */
