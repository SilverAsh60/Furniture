
import 'package:flutter/material.dart';

import '../../models/user_model.dart';


class ResultRegister extends StatefulWidget {
  const ResultRegister({super.key, required this.userSQ});
  final UserSQ userSQ;

  @override
  State<ResultRegister> createState() => _ResultRegisterState();
}

class _ResultRegisterState extends State<ResultRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}