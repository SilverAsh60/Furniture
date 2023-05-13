import 'package:auto_size_text/auto_size_text.dart';
import 'package:final_project_funiture_app/provider/product_provider.dart';
import 'package:final_project_funiture_app/screens/product_detail.dart';
import 'package:final_project_funiture_app/services/DatabaseHandler.dart';
import 'package:final_project_funiture_app/widgets/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/favorite_model.dart';
import '../models/product_model.dart';
import 'cart.dart';
import 'favorite.dart';
import 'package:badges/badges.dart' as badges;

class Search extends StatefulWidget {

  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

ProductProvider productProvider = ProductProvider();
final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

class _SearchState extends State<Search> {
  final TextEditingController searchQuery = TextEditingController();
  late DatabaseHandler handle;
  List<Product> searchedProducts = [];
  late double height, width;
  late List<Favorite> listFavorite;
  late List<Cart> listCart;
  late Favorite favorite;

  int page = 1;

  @override
  void initState() {
    super.initState();
    handle = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    listCart = handle.getListCart;
    listFavorite = handle.getListFavorite;

    return Scaffold(
      key: key,
      backgroundColor: const Color(0xfff2f9fe),
      appBar: page == 1 ? AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const AutoSizeText(
          'Search',
          maxFontSize: 17,
          minFontSize: 12,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          badges.Badge(
            showBadge: listFavorite.isNotEmpty,
            position: badges.BadgePosition.topEnd(top: 10, end: 5),
            badgeContent: Text(
              listFavorite.length.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: Color(0xff80221e),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const FavoritePage()));
                }),
          ),
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 10, end: 5),
            showBadge: listCart.isNotEmpty,
            badgeContent: Text(
              listCart.length.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Color(0xff80221e),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartPage()));
                }),
          ),
        ],
      ) : null,
      body: page == 1 ? getSearchResult() : getFilter(),
      bottomNavigationBar: getFooter(1, context),
    );
  }

  Widget getSearchResult() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                                      onChanged: (value) {
                                        productProvider.getProductByName(value);
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
            ],
          ),
        ),
      ),
    );
  }

  Widget getFilter() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                                      onChanged: (value) {
                                        productProvider.getProductByName(value);
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
            ],
          ),
        ),
      ),
    );
  }
}


// Widget getProductList(List<Product> produceList, BuildContext context) {
//   //AssetImage placeImage = const AssetImage("assets/images/logo.png");
//   if(produceList.isNotEmpty) {
//     return Container(
//       margin: const EdgeInsets.only(left: 10,right: 10),
//       height: 300,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Wrap(
//           spacing: -1,
//           direction: Axis.vertical,
//           children: produceList
//               .map(
//                 (element) => Container(
//               //margin: const EdgeInsets.symmetric(horizontal: 5),
//               alignment: Alignment.center,
//               //padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.only(top: 20,right: 10),
//               width: 200,
//               height: 260,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 color: Colors.white,
//               ),
//
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) =>
//                           ProductDetailPage(productID: element,)));
//                 },
//                 child: Stack(
//                   children: [
//                     // img
//                     Container(
//                       width: 200,
//                       height: 170,
//                       padding: const EdgeInsets.all(10),
//                       child: Hero(
//                         tag: element.id,
//                         child: FadeInImage(
//                           image: AssetImage(element.img),
//                           fadeInDuration: const Duration(milliseconds: 2000),
//                           fit: BoxFit.contain,
//                           placeholder: const AssetImage("assets/icons/spinner170.gif"),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(top: 150),
//                       padding: const EdgeInsets.all(5),
//                       height: 260,
//                       alignment: Alignment.bottomCenter,
//                       child: Row(
//                         children: [
//                           Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // name product
//                                   AutoSizeText(
//                                     element.name,
//                                     maxFontSize: 18,
//                                     minFontSize: 12,
//                                     textAlign: TextAlign.start,
//                                     style: const TextStyle(
//                                       color: Colors.black,
//                                       fontFamily: "Roboto",
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 2,
//                                   ),
//                                   // title product
//                                   Text(
//                                     element.title,
//                                     textAlign: TextAlign.start,
//                                     style: const TextStyle(
//                                       color: Colors.black,
//                                       fontFamily: "Roboto",
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 2,
//                                   ),
//
//                                   // Rate
//                                   RatingBar.builder(
//                                     ignoreGestures: true,
//                                     initialRating: element.review,
//                                     itemSize: 15,
//                                     minRating: 0,
//                                     direction: Axis.horizontal,
//                                     allowHalfRating: true,
//                                     itemCount: 5,
//                                     unratedColor: Colors.grey,
//                                     itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
//                                     itemBuilder: (context, _) => const Icon(
//                                       Icons.star,
//                                       color: Colors.amber,
//                                     ),
//                                     onRatingUpdate: (rating) {
//                                       //print(rating);
//                                     },
//                                   ),
//
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     children: [
//                                       AutoSizeText(
//                                         "(Sold ${element.sellest.toStringAsFixed(0)})",
//                                         maxFontSize: 12,
//                                         minFontSize: 12,
//                                         textAlign: TextAlign.start,
//                                         style: const TextStyle(
//                                           color: Colors.black,
//                                           fontFamily: "Roboto",
//                                           fontWeight: FontWeight.normal,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                           ),
//                           Column(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: 40,
//                                   width: 40,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(width: 1,color: const Color(0xff81220e)),
//                                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                                   ),
//
//                                   child: const Icon(Icons.shopping_cart , color: Color(0xff81220e),size: 25,),
//                                 ),
//                               ),
//                               const SizedBox(height: 20,),
//                               AutoSizeText(
//                                 getDecorPrice(element.currentPrice),
//                                 maxFontSize: 15,
//                                 minFontSize: 12,
//                                 textAlign: TextAlign.start,
//                                 style: const TextStyle(
//                                   color: Color(0xff80221e),
//                                   fontFamily: "Roboto",
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//               .toList(),
//         ),
//       ),
//     );
//   }
//   else {
//     return Container();
//   }
// }