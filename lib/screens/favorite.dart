import 'package:final_project_funiture_app/models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:final_project_funiture_app/services/FavoriteDatabaseHandle.dart';
import 'package:final_project_funiture_app/models/product_model.dart';
import 'package:final_project_funiture_app/widgets/favorite_list.dart';
import '../models/product_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:final_project_funiture_app/models/favorite_model.dart';
import 'package:final_project_funiture_app/screens/product_detail.dart';
import 'package:final_project_funiture_app/services/FavoriteDatabaseHandle.dart';
import 'package:final_project_funiture_app/widgets/bottom_navy_bar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  late FavoriteDatabaseHandler favoriteDatabaseHandler;

  List<Favorite> listFavorite = [];

  @override
  void initState() {
    super.initState();
    favoriteDatabaseHandler = FavoriteDatabaseHandler();
    favoriteDatabaseHandler.retrieveFavorites();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        listFavorite = favoriteDatabaseHandler.getListFavorite;
      });
    });

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
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, bottom: 10, top: 20, right: 10),
                    alignment: Alignment.center,
                    child: const Text(
                      "Favorite products",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "SecularOne Regular",
                      ),
                    ),
                  ),
                  // getFavoriteList(listFavorite, context),
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 220,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: -1,
                        direction: Axis.vertical,
                        children: listFavorite
                            .map(
                              (element) => Container(
                                // margin: EdgeInsets.symmetric(horizontal: 5),
                                alignment: Alignment.center,
                                width: 200,
                                height: 200,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  gradient: RadialGradient(colors: [
                                    Colors.white,
                                    Colors.white,
                                  ]),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(179, 213, 242, 0.2),
                                      spreadRadius: 5,
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                                margin: const EdgeInsets.all(7),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailPage(
                                                    productID:
                                                        element.idProduct)));
                                  },
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          /*FadeInImage(
                            image: NetworkImage(element.img),
                            width: 200,
                            height: 120, placeholder: placeImage,
                          ),*/
                                          const Image(
                                            image: AssetImage(
                                                "assets/images/logo.png"),
                                            width: 200,
                                            height: 120,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          AutoSizeText(
                                            element.nameProduct,
                                            maxFontSize: 15,
                                            minFontSize: 12,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Open Sans",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          AutoSizeText(
                                            getDecorPrice(element.price),
                                            maxFontSize: 15,
                                            minFontSize: 12,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              color: Color(0xff80221e),
                                              fontFamily: "Open Sans",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Container(
                                          //   margin: const EdgeInsets.only(left: 5),
                                          //   width: 40,
                                          //   height: 40,
                                          //   alignment: Alignment.center,
                                          //   decoration: const BoxDecoration(
                                          //     color: Color(0xff81221e),
                                          //     borderRadius:
                                          //         BorderRadius.all(Radius.circular(20)),
                                          //   ),
                                          //   child: const Text(
                                          //     'New',
                                          //     style: TextStyle(color: Colors.white),
                                          //   ),
                                          // ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              favoriteDatabaseHandler
                                                  .deleteFavorite(
                                                      element.idFavorite);

                                              favoriteDatabaseHandler
                                                  .retrieveFavorites();

                                              setState(() {
                                                listFavorite =
                                                    favoriteDatabaseHandler
                                                        .getListFavorite;
                                              });

                                              rebuildAllChildren(context);
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
      bottomNavigationBar: getFooter(4, context),
    );
  }
}

void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }

  (context as Element).visitChildren(rebuild);
}
