import 'package:final_project_funiture_app/provider/banner_provider.dart';
import 'package:final_project_funiture_app/provider/category_provider.dart';
import 'package:final_project_funiture_app/provider/product_provider.dart';
import 'package:final_project_funiture_app/screens/home.dart';
import 'package:final_project_funiture_app/screens/login.dart';
import 'package:final_project_funiture_app/screens/product_detail.dart';
import 'package:final_project_funiture_app/screens/register.dart';
import 'package:final_project_funiture_app/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<BannerProvider>(
          create: (context) => BannerProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff410000),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
