import 'package:flutter/material.dart';
import 'package:matjarcom/general_functions.dart';
import 'package:matjarcom/globals.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      // when connect to api desplay ProductInfo filter byId hold by the query
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List filterdList = products.where((e) => e.title!.contains(query)).toList();

    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: query == '' ? products.length : filterdList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            SizedBox(
              height: size.height * .02,
            ),
            GestureDetector(
              onTap: () {
                // when connect with api => query = products[index].id
                query = query == ''
                    ? products[index].title
                    : filterdList[index].title;
                showResults(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Opacity(
                  opacity: .75,
                  child: Container(
                    width: double.infinity,
                    // height: size.height * .12,
                    color: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          query == ''
                              ? CircleAvatar(
                                  radius: size.height * .1 / 2,
                                  backgroundImage: AssetImage(
                                      products[index].imagePath ?? ''),
                                )
                              : CircleAvatar(
                                  radius: size.height * .1 / 2,
                                  backgroundImage: AssetImage(
                                      filterdList[index].imagePath ?? ''),
                                ),
                          SizedBox(
                            width: size.width * .013,
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                query == ''
                                    ? Text(
                                        products[index].title ?? '',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        filterdList[index].title ?? '',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'SubTotal: \$ ${calcSubTotalPrice(index)}',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
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
                            child: query == ''
                                ? Text(
                                    products[index].quantity.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )
                                : Text(
                                    products[index].quantity.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
