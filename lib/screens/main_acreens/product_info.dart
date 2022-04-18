import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matjarcom/globals.dart';
import 'package:matjarcom/general_functions.dart';
import 'package:matjarcom/screens/main_acreens/cart.dart';

class ProductInfo extends StatefulWidget {
  static String id = 'ProductInfo';

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String _imagePath = ModalRoute.of(context)?.settings.arguments as String;
    return _buildBody(size, _imagePath, context);
  }

  Scaffold _buildBody(Size size, String _imagePath, BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildImage(size, _imagePath),
          _buildUpperRow(size, context),
          _buildBottomColumn(size)
        ],
      ),
    );
  }

  SizedBox _buildImage(Size size, String _imagePath) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Image.asset(
        _imagePath,
        fit: BoxFit.fill,
      ),
    );
  }

  Container _buildUpperRow(Size size, BuildContext context) {
    return Container(
      height: size.height * .1,
      // color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(.85),
              size: 30,
            ),
          ),
          GestureDetector(
            onTapUp: (details) {
              showMenu(
                  context: context,
                  elevation: 0,
                  color: Colors.white.withOpacity(.85),
                  position: calcMenuItemPosition(details.globalPosition.dx,
                      details.globalPosition.dy, size),
                  items: [
                    PopupMenuItem(
                        child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, Cart.id);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.select_all),
                              Text(tr('VIEW'),
                                  style: GoogleFonts.oswald(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black45),
                                  )),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            products.clear();
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.clear),
                              Text(tr('CLEAR'),
                                  style: GoogleFonts.oswald(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black45),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ]);
            },
            child: const Icon(
              Icons.shopping_basket,
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }

  Positioned _buildBottomColumn(Size size) {
    return Positioned(
      bottom: 0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Opacity(
              opacity: .65,
              child: Container(
                width: size.width,
                height: size.height * .25,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr('Test Title'),
                          style: GoogleFonts.oswald(
                            textStyle: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          )),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text('\$ 50',
                          style: GoogleFonts.oswald(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              color: Colors.black,
                              width: 33,
                              height: 33,
                              child: GestureDetector(
                                onTap: () {
                                  if (_quantity <= 20) {
                                    setState(() {
                                      _quantity += 1;
                                    });
                                  }
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '$_quantity',
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          ClipOval(
                            child: Container(
                              color: Colors.black,
                              width: 33,
                              height: 33,
                              child: GestureDetector(
                                onTap: () {
                                  if (_quantity > 1) {
                                    setState(() {
                                      _quantity -= 1;
                                    });
                                  }
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MaterialButton(
              minWidth: size.width,
              height: size.height * .1,
              color: Colors.black87,
              child: Text(tr('ADD TO CART'),
                  style: GoogleFonts.laila(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
