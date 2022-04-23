import 'package:flutter/material.dart';
import 'package:matjarcom/screens/main_acreens/home/admin_screens/secondary/meals_page.dart';
import 'package:matjarcom/screens/main_acreens/home/admin_screens/secondary/orders_page.dart';
import 'package:matjarcom/screens/main_acreens/home/admin_screens/secondary/users_page.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Center(
          child: ListView(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, UsersPage.id);
                },
                child: Card(
                  color: Colors.white,
                  elevation: .5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .17,
                          child: Image.asset(
                            'assets/images/profile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        Opacity(
                          opacity: .2,
                          child: Container(
                              color: Colors.black12,
                              width: double.infinity,
                              height: 40,
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Users',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MealsPage.id);
                },
                child: Card(
                  color: Colors.white,
                  elevation: .5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .15,
                          child: Image.asset(
                            'assets/images/main_meal.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: size.height * .072),
                        Opacity(
                          opacity: .2,
                          child: Container(
                              color: Colors.black12,
                              width: double.infinity,
                              height: 40,
                              alignment: Alignment.topCenter,
                              child: Text(
                                'meals',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, OrdersPage.id);
            },
            child: Card(
              child: Container(
                color: Colors.white,
                width: size.width * .9,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/store.png'),
                    Container(
                      width: size.width * .275,
                      height: size.height * .1,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Text(
                        'Orders',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
