import 'dart:async';

import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void timing() {
    Timer.periodic(
      Duration(seconds: 3),
      (value) {
        Navigator.pushReplacementNamed(context, "homePage");
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191a2c),
      body: Center(
        child: SizedBox(
          width: 100.0,
          child: Image.asset(
            "assets/icons/icon.png",
          ),
        ),
      ),
    );
  }
}
