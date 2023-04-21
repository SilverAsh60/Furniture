import 'package:auto_size_text/auto_size_text.dart';
import 'package:final_project_funiture_app/models/favorite_model.dart';
import 'package:final_project_funiture_app/screens/product_detail.dart';
import 'package:final_project_funiture_app/services/FavoriteDatabaseHandle.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

Widget getFavoriteList(List<Favorite> produceList, BuildContext context) {
  AssetImage placeImage = const AssetImage("assets/images/logo.png");

  FavoriteDatabaseHandler favoriteDatabaseHandler = FavoriteDatabaseHandler();

  return Container(
    margin: const EdgeInsets.all(10),
    height: 220,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: -1,
        direction: Axis.vertical,
        children: produceList
            .map(
              (element) => Container(
                // margin: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(productID: element.idProduct)));
                  },
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /*FadeInImage(
                            image: NetworkImage(element.img),
                            width: 200,
                            height: 120, placeholder: placeImage,
                          ),*/
                          const Image(
                            image: AssetImage("assets/images/logo.png"),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  .deleteFavorite(element.idFavorite);
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
  );
}

String getDecorPrice(double price) {
  String priceDecor = "";
  String test = price.toString();
  String temp = "";

  if (test.contains('.') == true) {
    temp = test.substring(test.indexOf('.'), test.length);
    test = test.substring(0, test.indexOf('.'));

    int number = 0;
    for (int i = test.length - 1; i >= 0; i--) {
      number++;
      if (number == 3) {
        priceDecor = '$priceDecor${test[i]},';
        number = 0;
      } else {
        priceDecor = '$priceDecor${test[i]}';
      }
    }
  } else {
    int number = 0;
    for (int i = test.length - 1; i >= 0; i--) {
      number++;
      if (number == 3) {
        priceDecor = '$priceDecor${test[i]},';
        number = 0;
      } else {
        priceDecor = '$priceDecor${test[i]}';
      }
    }
  }

  priceDecor = priceDecor.split('').reversed.join('');
  if (priceDecor.indexOf(',') == 0) {
    priceDecor = priceDecor.substring(1, priceDecor.length);
  }

  priceDecor = "\$ $priceDecor$temp";
  return priceDecor;
}
