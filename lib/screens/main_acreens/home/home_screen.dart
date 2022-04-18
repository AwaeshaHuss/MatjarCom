import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matjarcom/general_functions.dart';
import 'package:matjarcom/globals.dart';
import 'package:matjarcom/screens/main_acreens/cart.dart';
import 'package:matjarcom/screens/main_acreens/product_info.dart';
import 'package:matjarcom/services/search_delegate.dart';
import 'package:matjarcom/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        showExitDialog(context);
        return true;
      },
      child: Stack(
        children: [
          DefaultTabController(
            length: 4,
            child: Scaffold(
                key: _key,
                drawer: AppDrawer(),
                appBar: _buildAppBar(),
                body: TabBarView(children: [
                  _MealView(size, context),
                  _SnackView(size, context),
                  _DessertView(size, context),
                  _DrinkView(size, context),
                ])),
          ),
          Material(
            child: Container(
              // height: size.height * .15,
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tr('HOME'),
                          style: GoogleFonts.oswald(
                            textStyle: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        GestureDetector(
                          onTapUp: (details) {
                            showMenu(
                                context: context,
                                elevation: 0,
                                color: Colors.white.withOpacity(.85),
                                position: calcMenuItemPosition(
                                    details.globalPosition.dx,
                                    details.globalPosition.dy,
                                    size),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(Icons.select_all),
                                            Text(tr('VIEW'),
                                                style: GoogleFonts.oswald(
                                                  textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black45,
                                                      backgroundColor:
                                                          Colors.white),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(Icons.clear),
                                            Text(tr('CLEAR'),
                                                style: GoogleFonts.oswald(
                                                  textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black45,
                                                      backgroundColor:
                                                          Colors.white),
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
                    const Divider(
                      thickness: .5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!_key.currentState!.isDrawerOpen) {
                              _key.currentState?.openDrawer();
                            } else
                              Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.menu_open,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showSearch(
                                context: context,
                                delegate: CustomSearchDelegate());
                          },
                          child: const Icon(Icons.search),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _MealView(Size size, context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .8,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/meal1.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/meal1.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              tr('Lebanees'),
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              tr('\$ 20'),
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //-------------------1End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/meal2.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/meal2.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Shawarma',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 25',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //------------------2End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/meal3.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/meal3.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Italian',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 30',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //------------------3End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/meal5.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/meal5.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Brosted',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 25',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //-----------------4End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/meal4.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/meal4.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'BBQ',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 60',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //-------------------5End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/meal3.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/meal3.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Italian',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 40',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //------------------6End
      ],
    );
  }

  Widget _SnackView(Size size, context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .8,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/snack1.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/snack1.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Meat Balls',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 20',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //-------------------1End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/snack2.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/snack2.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Flat Kubah',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 30',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //------------------2End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/snack3.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/snack3.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Smabusa',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 15',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //------------------3End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/snack4.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/snack4.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Fried Botatos',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 10',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //-----------------4End
      ],
    );
  }

  Widget _DessertView(Size size, context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .8,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/dessert1.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/dessert1.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Cup Cake',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 20',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //-------------------1End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/dessert2.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/dessert2.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Orieo Cake',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 30',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //------------------2End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/dessert3.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/dessert3.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Froot Mix',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 35',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //------------------3End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/dessert4.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/dessert4.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Gatto',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 40',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //-----------------4End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/dessert5.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/dessert5.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Cheese Cake',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 45',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //----------------5End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/dessert6.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/dessert6.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Knafah',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 50',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //---------------------6End
      ],
    );
  }

  Widget _DrinkView(Size size, context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .8,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/drink1.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/drink1.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Strawberry Drink',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 20',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //-------------------1End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/drink2.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/drink2.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Strawberry Nictare',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 30',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //------------------2End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/drink3.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/drink3.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Manjoo Nictare',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 35',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //------------------3End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/drink4.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/drink4.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Soda',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 40',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //-----------------4End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/drink5.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/drink5.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Botteld Water',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 20',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //----------------5End
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductInfo.id,
                arguments: 'assets/images/drink1.jpeg');
          },
          child: Card(
            borderOnForeground: false,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white70, width: 4, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/images/drink1.jpeg',
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: .85,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      width: size.width / 2,
                      height: size.height * .07,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Strawberry Drink',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$ 20',
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //-------------------6End
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: TabBar(
        indicatorColor: Colors.black38,
        indicatorWeight: 4,
        onTap: (value) {
          setState(() {
            _tabIndex = value;
          });
        },
        tabs: [
          Text(
            tr('Meals'),
            style: GoogleFonts.oswald(
              textStyle: TextStyle(
                  color: _tabIndex == 0 ? Colors.black : Colors.grey,
                  fontSize: _tabIndex == 0 ? 14 : 12,
                  fontWeight:
                      _tabIndex == 0 ? FontWeight.bold : FontWeight.w300),
            ),
          ),
          Text(
            tr('Snacks'),
            style: GoogleFonts.oswald(
              textStyle: TextStyle(
                  color: _tabIndex == 1 ? Colors.black : Colors.grey,
                  fontSize: _tabIndex == 1 ? 14 : 12,
                  fontWeight:
                      _tabIndex == 1 ? FontWeight.bold : FontWeight.w300),
            ),
          ),
          Text(
            tr('Dessert'),
            style: GoogleFonts.oswald(
              textStyle: TextStyle(
                  color: _tabIndex == 2 ? Colors.black : Colors.grey,
                  fontSize: _tabIndex == 2 ? 14 : 12,
                  fontWeight:
                      _tabIndex == 2 ? FontWeight.bold : FontWeight.w300),
            ),
          ),
          Text(
            tr('Drinks'),
            style: GoogleFonts.oswald(
              textStyle: TextStyle(
                  color: _tabIndex == 3 ? Colors.black : Colors.grey,
                  fontSize: _tabIndex == 3 ? 14 : 12,
                  fontWeight:
                      _tabIndex == 3 ? FontWeight.bold : FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
