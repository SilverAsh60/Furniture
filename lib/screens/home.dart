import 'package:final_project_funiture_app/provider/banner_provider.dart';
import 'package:final_project_funiture_app/provider/category_provider.dart';
import 'package:final_project_funiture_app/provider/product_provider.dart';
import 'package:final_project_funiture_app/screens/cart.dart';
import 'package:final_project_funiture_app/services/FavoriteDatabaseHandle.dart';
import 'package:final_project_funiture_app/widgets/banner.dart';
import 'package:final_project_funiture_app/widgets/bottom_navy_bar.dart';
import 'package:final_project_funiture_app/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import '../services/DatabaseHandler.dart';
import '../widgets/category_list.dart';
import '../widgets/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

BannerProvider bannerProvider = BannerProvider();
CategoryProvider categoryProvider = CategoryProvider();
ProductProvider productProvider = ProductProvider();

class _HomePageState extends State<HomePage> {
  late DatabaseHandler handler;
  late FavoriteDatabaseHandler favoriteDatabaseHandler;
  final TextEditingController searchQuery = TextEditingController();

  int cartBadgeAmount = 0;
  int favoriteBadgeAmount = 0;
  late bool showCartBadge;
  late bool showFavoriteBadge;

  late double height, width;

  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  void getCallAllFunction() {
    categoryProvider.getCategory();
    productProvider.getProduct();
  }

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    favoriteDatabaseHandler = FavoriteDatabaseHandler();
    getCallAllFunction();
  }

  @override
  Widget build(BuildContext context) {
    bannerProvider = Provider.of<BannerProvider>(context);
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    getCallAllFunction();

    setState(() {
      int cartAmount = handler.getListCart.length;
      int favoriteAmount = favoriteDatabaseHandler.getListFavorite.length;
      cartBadgeAmount = cartAmount;
      favoriteBadgeAmount = favoriteAmount;

      favoriteDatabaseHandler.retrieveFavorites();
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
                  header(context, cartBadgeAmount, favoriteBadgeAmount, height,
                      width),
                  searchField(width, searchQuery, context),
                  const BannerWidget(),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, bottom: 10, top: 20, right: 10),
                    alignment: Alignment.center,
                    child: const Text(
                      "Category",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "SecularOne Regular"),
                    ),
                  ),
                  getCategoryList(categoryProvider.getListCategory),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, bottom: 10, top: 20, right: 10),
                    alignment: Alignment.center,
                    child: const Text(
                      "New Archive",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "SecularOne Regular",
                      ),
                    ),
                  ),
                  getProductList(productProvider.searchProducts, context),
                  getProductList(productProvider.getListProduct, context),
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

Widget header(BuildContext context, int cartBadgeAmount,
    int favoriteBadgeAmount, double height, width) {
  bool showCartBadge = cartBadgeAmount > 0;
  bool showFavoriteBadge = favoriteBadgeAmount > 0;

  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  maxRadius: height * 0.1 / 2.1,
                  backgroundColor: Colors.white,
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(0),
                    child: const Image(
                      image: AssetImage("assets/icons/user.png"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: const [
                Text(
                  "Good morning you",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Login to order",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            badges.Badge(
              showBadge: showFavoriteBadge,
              badgeContent: Text(favoriteBadgeAmount.toString()),
              child: IconButton(
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    color: Color(0xff80221e),
                  ),
                  onPressed: () {}),
            ),
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
        )
      ],
    ),
  );
}

Widget drawShape(BuildContext context) {
  return ClipPath(
    clipper: Clipper(),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        height: 200,
        blur: 0,
        border: 0,
        borderGradient: LinearGradient(colors: [
          Colors.black.withOpacity(0.0),
          Colors.black12.withOpacity(0.0)
        ]),
        borderRadius: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xffa23c4c).withOpacity(0.4),
            const Color(0xffa23c4c).withOpacity(0.4),
            const Color(0xffa23c4c).withOpacity(0.4),
            const Color(0xffa23c4c).withOpacity(0.4),
            const Color(0xffa23c4c).withOpacity(0.4),
          ],
          stops: const [0.2, 0.4, 0.6, 0.8, 1],
        ),
      ),
    ),
  );
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 70);

    var firstStart = Offset(size.width / 2, size.height);
    var firstEnd = Offset(size.width, size.height - 70);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
