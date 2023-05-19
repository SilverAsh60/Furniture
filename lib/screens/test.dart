import 'package:flutter/material.dart';
import 'package:furniture_app_project/provider/user_provider.dart';
import 'package:furniture_app_project/widgets/bottom_navy_bar.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

UserProvider userProvider = UserProvider();

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Stack(
          children: [
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 200),
              painter: CustomProfilePageShadow(),
            ),
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 200),
              painter: CustomProfilePage(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: getFooter(4, context),
    );
  }
}



class CustomProfilePage extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xff81221e)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height - 50);
    path0.quadraticBezierTo(size.width / 2, size.height,
        size.width, size.height - 50);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomProfilePageShadow extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xff81221e).withOpacity(0.2)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height - 40);
    path0.quadraticBezierTo(size.width / 2, size.height,
        size.width, size.height - 40);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}