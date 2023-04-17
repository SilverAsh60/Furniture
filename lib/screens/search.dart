import 'package:final_project_funiture_app/provider/banner_provider.dart';
import 'package:final_project_funiture_app/provider/category_provider.dart';
import 'package:final_project_funiture_app/provider/product_provider.dart';
import 'package:final_project_funiture_app/screens/cart.dart';
import 'package:final_project_funiture_app/services/FavoriteDatabaseHandle.dart';
import 'package:final_project_funiture_app/widgets/banner.dart';
import 'package:final_project_funiture_app/widgets/bottom_navy_bar.dart';
import 'package:final_project_funiture_app/widgets/product_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import '../services/DatabaseHandler.dart';
import '../widgets/category_list.dart';
import '../widgets/search.dart';
import '../models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_funiture_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  final String query;

  const Search({required this.query, super.key});

  @override
  State<Search> createState() => _SearchState();
}

ProductProvider productProvider = ProductProvider();

class _SearchState extends State<Search> {
  final TextEditingController searchQuery = TextEditingController();
  List<Product> searchedProducts = [];

  void searchProductsByName(String query) async {
    List<Product> newList = [];

    QuerySnapshot productSnapshot =
        await FirebaseFirestore.instance.collection("product").get();

    for (var doc in productSnapshot.docs) {
      var product = Product(
        img: doc["img"],
        name: doc["name"],
        id: doc.reference.id,
        size: Map.from(doc["size"]),
        rootPrice: double.parse(doc["rootPrice"].toString()),
        currentPrice: double.parse(doc["currentPrice"].toString()),
        categoryItemId: doc["categoryItemId"].toString(),
        description: doc["description"].toString(),
        status: doc["status"].toString(),
        material: Map.from(doc["material"]),
        review: double.parse(doc["review"].toString()),
        sellest: double.parse(doc["sellest"].toString()),
        dateEnter: DateFormat("d/M/y").parse(doc['dateEnter']),
      );

      newList.add(product);
    }

    var searchProducts = newList.where((element) {
      return element.name.contains(query + '');
    }).toList();

    setState(() {
      searchedProducts = searchProducts;
    });
  }

  late double height, width;

  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  void getCallAllFunction() {
    productProvider.getProduct();
  }

  @override
  void initState() {
    super.initState();
    getCallAllFunction();
    searchProductsByName(widget.query);
    searchQuery.text = widget.query;
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    getCallAllFunction();

    return Scaffold(
      key: key,
      backgroundColor: const Color(0xfff2f9fe),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(0),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  header(context),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 0,
                            left: 10,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ]),
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 20, left: 20),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xff80221e),
                                  borderRadius: BorderRadius.circular(20),
                                  // shape: BoxShape.circle
                                ),
                                child: const Center(
                                    child: Icon(Icons.search_rounded)),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(0),
                                  width: (width - 90) * 0.7,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          cursorColor: const Color(0xff410000),
                                          style: const TextStyle(
                                              // letterSpacing: 1,
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                          controller: searchQuery,
                                          onSubmitted: (value) {
                                            searchProductsByName(value);
                                            // ProductProvider productProvider =
                                            //     ProductProvider();
                                            // productProvider
                                            //     .searchProductsByName(value);
                                            // var products = productProvider
                                            //     .getSearchProduct;
                                            // print(products);
                                            // setState(() {
                                            //   searchedProducts = products;
                                            // });
                                          },
                                        )
                                      ]),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Icon(
                                        Icons.tune,
                                        color: Color(0xff80221e),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   padding: const EdgeInsets.only(
                  //       left: 10, bottom: 10, top: 20, right: 10),
                  //   alignment: Alignment.center,
                  //   child: const Text(
                  //     "New Archive",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold,
                  //       fontFamily: "SecularOne Regular",
                  //     ),
                  //   ),
                  // ),
                  getProductList(searchedProducts, context),
                ],
              )
            ]),
          ),
        ),
      ),
      bottomNavigationBar: getFooter(0, context),
    );
  }
}

Widget header(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              children: [],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: const [
                Text(
                  "Search results",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}
