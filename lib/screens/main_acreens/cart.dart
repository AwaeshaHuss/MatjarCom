import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matjarcom/globals.dart';
import 'package:matjarcom/general_functions.dart';
import 'package:matjarcom/screens/main_acreens/checkout.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  static String id = 'Cart';
  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Scaffold _buildScaffold(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    int _index = 1;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: _buildBody(size, statusBarHeight, appBarHeight, _index),
    );
  }

  Column _buildBody(
      Size size, double statusBarHeight, double appBarHeight, int _index) {
    return Column(
      children: [
        SizedBox(
          height: calcCartListViewHeight(size, statusBarHeight, appBarHeight) -
              size.height *
                  .13, // this line is the height of Bottom Container Upove the Button
          child: ListView.builder(
            // shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              _index = index;
              print(_index);
              return Slidable(
                key: UniqueKey(),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () {
                      products.remove(products[index]);
                    },
                    closeOnCancel: true,
                  ),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        print('delete product[$index]');
                        // products.remove(products[index]);
                      },
                      backgroundColor: kRedColor,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: tr('DELETE'),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTapUp: (details) {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Opacity(
                      opacity: .75,
                      child: Container(
                        width: double.infinity,
                        height: size.height * .12,
                        color: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: size.height * .1 / 2,
                                backgroundImage:
                                    AssetImage(products[index].imagePath ?? ''),
                              ),
                              SizedBox(
                                width: size.width * .013,
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(products[index].title ?? '',
                                        style: GoogleFonts.oswald(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                        '${tr('SubTotal:')} \$ ${calcSubTotalPrice(_index)}',
                                        style: GoogleFonts.oswald(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width * .3,
                              ),
                              Expanded(
                                  child: Container(
                                alignment: Alignment.center,
                                height: size.height * .1,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Text(products[index].quantity.toString(),
                                    style: GoogleFonts.oswald(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Opacity(
          opacity: 0.6,
          child: Container(
            padding: const EdgeInsets.only(top: 40),
            width: size.width,
            height: size.height * .13,
            color: Colors.grey.withOpacity(.35),
            child: Text(
              '${tr('Total Price:')}\t \$' + calcTotalPrice(),
              style: GoogleFonts.oswald(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Builder(
          builder: (context) => ButtonTheme(
            minWidth: size.width,
            height: size.height * .09,
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.black,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              onPressed: () {
                Navigator.pushNamed(context, CheckOut.id);
              },
              child: Text(tr('CheckOut').toUpperCase(),
                  style: GoogleFonts.laila(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        )
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(tr('My Cart').toUpperCase(),
          style: GoogleFonts.oswald(
            textStyle: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800),
          )),
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


/* 
// this method block is for desplaying [delete Action Row] on Item Tap Listener
                      showMenu(
                      elevation: 0,
                      context: context,
                      position: calcMenuItemPosition(details.globalPosition.dx,
                          details.globalPosition.dy, size),
                      items: [
                        PopupMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              Text(
                                'DELETE',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.redAccent),
                              ),
                            ],
                          ),
                        ),
                      ]);

 */