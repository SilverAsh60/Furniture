import 'package:auto_size_text/auto_size_text.dart';
import 'package:final_project_funiture_app/screens/cart.dart';
import 'package:final_project_funiture_app/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../provider/product_provider.dart';
import '../services/DatabaseHandler.dart';
import 'package:badges/badges.dart' as badges;

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.productID});
  final String productID;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

ProductProvider productProvider = ProductProvider();

final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

void getCallAllFunction(String id) {
  productProvider.getProductItem(id);
  productProvider.getProductbyID(id);
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late DatabaseHandler handler;
  late Cart cart;

  late String imageMainCurrent;
  late String activeItem;
  late ProductItem productItem;
  late Product productCurrent;
  late int number = 0;

  @override
  void initState() {
    super.initState();
    number = 0;
    getCallAllFunction(widget.productID);
    handler = DatabaseHandler();
  }

  bool setActiveColor(String itemID) {
    if (itemID == activeItem) {
      return true;
    } else {
      return false;
    }
  }

  setProductItemCurrent(ProductItem v2) {
    setState(() {
      productItem = v2;
      imageMainCurrent = v2.img[0];
      activeItem = v2.id;
    });
  }

  AssetImage placeImage = const AssetImage("assets/images/logo.png");

  setCart(Cart v2) {
    setState(() {
      cart = v2;
    });
  }

  int cartBadgeAmount = 0;
  late bool showCartBadge;

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction(widget.productID);

    if (productProvider.getListProductItem.isNotEmpty) {
      //activeItem = productProvider.getListProductItem[0].id;
      //productItem = productProvider.getListProductItem[0];
      //imageMainCurrent = productProvider.getProductCurrent.img;
      if (number == 0) {
        productItem = productProvider.getListProductItem[0];
        imageMainCurrent = productProvider.getProductCurrent.img;
        activeItem = productProvider.getListProductItem[0].id;
        productItem = productProvider.getListProductItem[0];
        cart = Cart(
            quantity: 1,
            idProduct: productItem.id,
            price: productProvider.getProductCurrent.currentPrice,
            imgProduct: productProvider.getProductCurrent.img,
            nameProduct: productProvider.getProductCurrent.name,
            color: getNameColorFromMap(productItem.color));
        setState(() {});
      }

      setState(() {
        int cartAmount = handler.getListCart.length;
        cartBadgeAmount = cartAmount;
      });

      bool showCartBadge = cartBadgeAmount > 0;

      return Scaffold(
        backgroundColor: const Color(0xfff2f9fe),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const AutoSizeText(
            'Product detail',
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
              position: badges.BadgePosition.topEnd(top: 10, end: 5),
              showBadge: showCartBadge,
              badgeContent: Text(
                cartBadgeAmount.toString(),
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
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    getImage(productProvider.getListProductItem,
                        productProvider.getProductCurrent),
                    getInfor(productProvider.getProductCurrent, productItem),
                  ],
                )),
          ),
        ),
        bottomNavigationBar: getBottomBar(),
      );
    } else {
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      );
    }
  }

  Widget getImage(List<ProductItem> productItemList, Product productCurrent) {
    if (productItemList.isNotEmpty) {
      if (number == 0) {
        imageMainCurrent = productCurrent.img;
        activeItem = productItemList[0].id;
        productItem = productItemList[0];
        number++;
      }
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 4,
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                height: 300,
                child: ListView.builder(
                    itemCount: productItem.img.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          behavior: HitTestBehavior.deferToChild,
                          onTap: () {
                            setState(() {
                              imageMainCurrent = productItem.img[index];
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.only(bottom: 10),
                            /*child: FadeInImage(
                              image: NetworkImage(productItem.img[index]),
                              fit: BoxFit.fill, placeholder: placeImage,
                            ),*/

                            child: Image(
                              image: placeImage,
                              fit: BoxFit.fill,
                            ),
                          ));
                    }),
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                width: MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width / 4,
                height: 300,
                /*child: FadeInImage(
                  image: NetworkImage(imageMainCurrent),
                  fit: BoxFit.fill,
                  placeholder: placeImage,
                ),*/
                child: Image(
                  image: placeImage,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: -1,
                direction: Axis.vertical,
                children: productItemList
                    .map(
                      (element) => Stack(
                        children: [
                          Visibility(
                            visible: setActiveColor(element.id),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.deferToChild,
                            onTap: () {
                              setState(() {
                                imageMainCurrent = element.img[0];
                                setProductItemCurrent(element);
                                setCart(Cart(
                                    quantity: 1,
                                    idProduct: element.id,
                                    price: productCurrent.currentPrice,
                                    imgProduct: '',
                                    nameProduct: '',
                                    color: ''));
                                activeItem = element.id;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(13.5),
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: HexColor.fromHex(
                                    getColorFromMap(element.color)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      );
    } else {
      return const SizedBox(
        height: 400,
      );
    }
  }

  Widget getInfor(Product productCurrent, ProductItem productItem) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                productCurrent.name,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                getDecorPrice(productCurrent.currentPrice),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff81221e),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                getNameColorFromMap(productItem.color),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.star,
              color: Colors.grey,
            ),
            const Icon(
              Icons.star,
              color: Colors.grey,
            ),
            const Icon(
              Icons.star,
              color: Colors.grey,
            ),
            const Icon(
              Icons.star,
              color: Colors.grey,
            ),
            const Icon(
              Icons.star,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "(${productCurrent.review})",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Text(
                "Sells ${productCurrent.sellest.toStringAsFixed(0)}",
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Good to know',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Text(
                productCurrent.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Measurement',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: getDataTable(productCurrent.size, "Type", "Value"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Material',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: getDataTable(productCurrent.material, "Type", "Value"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Review',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getDataTable(Map<String, String> size, String text1, text2) {
    List<DefineSize> listSize = [];
    size.forEach((key, value) =>
        listSize.add(DefineSize(sizeType: key, sizeValue: value)));

    return DataTable(
      columns: [
        DataColumn(label: Text(text1)),
        DataColumn(label: Text(text2)),
      ],
      rows: listSize
          .map((e) => DataRow(cells: [
                DataCell(Text(e.sizeType)),
                DataCell(Text(e.sizeValue)),
              ]))
          .toList(),
    );
  }

  Widget getBottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xff80221e),
      selectedFontSize: 20,
      elevation: 0.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(
        color: Color(0xff80221e),
      ),
      backgroundColor: const Color(0x00ffffff),
      items: bottomNavigationItems,
      onTap: (selectedItem) => itemClick(selectedItem, handler),
    );
  }

  Future<void> itemClick(int selectedItem, DatabaseHandler handler) async {
    if (selectedItem == 0) {
    } else if (selectedItem == 1) {
    } else if (selectedItem == 2) {
      await handler.insertCart(cart);
      handler.retrieveCarts();
    } else if (selectedItem == 3) {}
  }
}

class DefineSize {
  late String sizeType;
  late String sizeValue;

  DefineSize({required this.sizeType, required this.sizeValue});
}

ProductItem changeValue(ProductItem v1, ProductItem v2) {
  return v2;
}

String getColorFromMap(Map<String, String> color) {
  var hexColor = "#ffffff";
  color.forEach((key, value) {
    hexColor = value;
  });

  return hexColor;
}

String getNameColorFromMap(Map<String, String> color) {
  var hexColor = "Grey";
  color.forEach((key, value) {
    hexColor = key;
  });

  return hexColor;
}

var bottomNavigationItems = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    icon: Icon(
      Icons.threed_rotation_outlined,
      color: Colors.black,
    ),
    label: "3D",
  ),
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    icon: Icon(Icons.screenshot_outlined, color: Colors.black),
    label: "AR",
  ),
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    icon: Icon(Icons.add, color: Colors.black),
    label: "Cart",
  ),
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    icon: Icon(Icons.favorite_border_outlined, color: Colors.black),
    label: "Favorite",
  ),
];
