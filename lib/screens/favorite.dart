import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app_project/models/product_model.dart';
import 'package:furniture_app_project/provider/product_provider.dart';
import 'package:furniture_app_project/screens/product_detail.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/favorite_model.dart';
import '../services/DatabaseHandler.dart';
import 'cart.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

ProductProvider productProvider = ProductProvider();

class _FavoritePageState extends State<FavoritePage> {
  late DatabaseHandler handler;
  late List<Cart> listCart;
  late List<Favorite> listFavorite;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);

    listCart = handler.getListCart;
    listFavorite = handler.getListFavorite;


    return Scaffold(
      backgroundColor: const Color(0xfff2f9fe),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const AutoSizeText(
          'Favorite',
          maxFontSize: 17,
          minFontSize: 12,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xff81221e),
            ),
            label: const Text(''),
          )
        ],
      ),
      body: listFavorite.isNotEmpty
          ? ListView.builder(
          itemCount: listFavorite.length,
          itemBuilder: (BuildContext context, int index) {
            //print(listFavorite[index].nameProduct);
            return Container(
              color: const Color(0xfff2f9fe),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                              productID: getProduct(
                                  listFavorite[index].idProduct))));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(179, 213, 242, 0.2),
                        spreadRadius: 5,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      // Img Product
                      SizedBox(
                        width: 90,
                        height: 90,
                        child: Image(
                          image: AssetImage(listFavorite[index].imgProduct),
                          width: 90,
                          height: 90 , fit: BoxFit.fill,),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // Name Product
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Text(
                            listFavorite[index].nameProduct,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$ ${listFavorite[index].price}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.red[700],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  handler.deleteFavorite(listFavorite[index].idFavorite!);
                                });
                              },
                              icon: const Icon(
                                Icons.delete_forever,
                                color: Colors.black,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          })
          : const Center(
        //
        child: CircularProgressIndicator(color: Color(0xff81221e),),
      ),
      bottomNavigationBar: listFavorite.isNotEmpty ? getFooter() : Container(height: 0,),
    );
  }

  Product getProduct(String idProduct) {
    var newList = productProvider.getListProduct
        .where((element) => element.id == idProduct)
        .toList();
    return newList[0];
  }

  Widget getFooter() {
    return Container(
      height: 120,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(179, 213, 242, 0.2),
            spreadRadius: 5,
            blurRadius: 3,
          ),
        ],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    for (var element in listFavorite) {
                      //handler.deleteFavorite(element.idFavorite!);
                    }
                    listFavorite = handler.getListFavorite;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xffb23a48),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text(
                    'Delete All',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
