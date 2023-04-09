import 'package:auto_size_text/auto_size_text.dart';
import 'package:final_project_funiture_app/screens/product_detail.dart';
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

Widget getProductList(List<Product> produceList, BuildContext context) {
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
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  gradient: RadialGradient(colors: [
                    Colors.white,
                    HexColor.fromHex(element.color),
                  ]),
                  boxShadow: const [
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailPage(productID: element.id)));
                  },
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: NetworkImage(element.img),
                            width: 150,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AutoSizeText(
                            element.name,
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
                            getDecorPrice(element.currentPrice),
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {},
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
  
  if(test[test.indexOf('.') + 1] == '0') {
    test = test.substring(0, test.indexOf('.'));

    int number = 0;
    for(int i=test.length-1 ; i >= 0 ; i--) {
      number++;
      if(number == 3) {
        priceDecor = '$priceDecor${test[i]},';
        number = 0;
      }
      else {
        priceDecor = '$priceDecor${test[i]}';
      }
    }
  }

  return priceDecor.split('').reversed.join('');
}
