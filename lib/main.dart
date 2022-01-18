import 'package:cryptowallet/pages/homePage.dart';
import 'package:cryptowallet/pages/loadingPage.dart';
import 'package:cryptowallet/pages/qrScannerPage.dart';
import 'package:cryptowallet/pages/signInPage.dart';
import 'package:cryptowallet/pages/signUpPage.dart';
import 'package:cryptowallet/pages/transactionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff191a2c),
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoadingPage(),
        "signInPage": (context) => SignInPage(),
        "signOutPage": (context) => SignUpPage(),
        "homePage": (context) => HomePage(),
        "transactionPage": (context) => TransactionPage(),
        "qrScannerPage": (context) => QRScannerPage(),
      },
    );
  }
}
