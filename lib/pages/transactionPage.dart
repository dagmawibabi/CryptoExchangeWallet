// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool isDarkMode = true;
  // Dark Mode
  Color appBarBG = Color(0xff191a2c);
  Color scaffoldBG = Color(0xff191a2c);
  Color bottomNavBarBG = Color(0xff191a2c);
  Color primaryTextColor = Colors.white;
  Color secondaryTextColor = Colors.grey[600]!;
  Color tirtiaryTextColor = Colors.white;
  Color primaryIconColor = Colors.white;
  Color secondaryContainerBG = Color(0xff1c1d2f);
  List<Color> cardGradient = [
    Color(0x11C85C5C),
    Color(0x112F86A6),
    Color(0x11C85C5C),
  ];
  void darkMode() {
    // Dark Mode
    if (isDarkMode == true) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Color(0xff191a2c),
          statusBarIconBrightness: Brightness.light,
        ),
      );
      appBarBG = Color(0xff191a2c);
      scaffoldBG = Color(0xff191a2c);
      bottomNavBarBG = Color(0xff191a2c);
      primaryTextColor = Colors.grey[200]!;
      secondaryTextColor = Colors.grey[600]!;
      tirtiaryTextColor = Colors.grey[500]!;
      primaryIconColor = Colors.white;
      secondaryContainerBG = Color(0xff1c1d2f);
      scaffoldBG = Color(0xff191a2c);
      cardGradient = [
        Color(0x11C85C5C),
        Color(0x112F86A6),
        Color(0x11C85C5C),
      ];
    }
    // Light Mode
    else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Color(0xffeeeeee),
          statusBarIconBrightness: Brightness.dark,
        ),
      );
      appBarBG = Colors.grey[200]!;
      scaffoldBG = Colors.grey[200]!;
      bottomNavBarBG = Color(0xffeeeeee);
      primaryTextColor = Colors.grey[900]!;
      secondaryTextColor = Colors.grey[600]!;
      tirtiaryTextColor = Colors.grey[500]!;
      primaryIconColor = Colors.black;
      secondaryContainerBG = Colors.grey[300]!.withOpacity(0.5);
      scaffoldBG = Color(0xffeeeeee);
      cardGradient = [
        Color(0xffb3ffab),
        Color(0xff12fff7),
      ];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    dynamic receivedData = ModalRoute.of(context)!.settings.arguments;
    isDarkMode = receivedData["isDarkMode"];
    String appBarTitle = receivedData["appBarTitle"];
    darkMode();
    return Scaffold(
      backgroundColor: scaffoldBG,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          appBarTitle,
        ),
        backgroundColor: Color(0xff191a2c),
      ),
      body: ListView(
        reverse: true,
        children: [
          NumericKeyboard(
            onKeyboardTap: (value) {},
            textColor: primaryTextColor,
            rightButtonFn: () {
              setState(() {
                //text = text.substring(0, text.length - 1);
              });
            },
            rightIcon: Icon(
              Icons.send,
              color: Colors.greenAccent,
            ),
            leftButtonFn: () {
              print('left button clicked');
            },
            leftIcon: Icon(
              Icons.backspace_outlined,
              color: secondaryTextColor,
            ),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          // Divider(color: tirtiaryTextColor.withOpacity(0.2)),
          const SizedBox(height: 20.0),
          Divider(color: tirtiaryTextColor.withOpacity(0.2)),
          const SizedBox(height: 200.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$20.36",
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 42.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Amount",
                style: TextStyle(
                  color: secondaryTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
