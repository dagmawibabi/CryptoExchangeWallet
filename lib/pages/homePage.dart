// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curPage = 0;
  bool isDarkMode = true;

  List cryptoStats = [];
  List cryptoHistory = [
    {
      "date": "Jan 27, 2021",
      "time": "06:36",
      "symbol": "BTC",
      "amount": 45.78,
      "address": "3DyzVHcBr7h3WxC8JfFN7JoznJqWknxyZW",
      "sent": false,
    },
    {
      "date": "Jan 27, 2021",
      "time": "06:36",
      "symbol": "BTC",
      "amount": 45.78,
      "address": "3DyzVHcBr7h3WxC8JfFN7JoznJqWknxyZW",
      "sent": true,
    },
    {
      "date": "Jan 27, 2021",
      "time": "06:36",
      "symbol": "BTC",
      "amount": 45.78,
      "address": "3DyzVHcBr7h3WxC8JfFN7JoznJqWknxyZW",
      "sent": false,
    },
    {
      "date": "Jan 27, 2021",
      "time": "06:36",
      "symbol": "BTC",
      "amount": 45.78,
      "address": "3DyzVHcBr7h3WxC8JfFN7JoznJqWknxyZW",
      "sent": true,
    },
  ];

  // Function to fetch crypto price data
  bool isCryptoPageLoading = true;
  bool isCryptoPageLoadingError = false;
  void getCryptoStats() async {
    var url = Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd");
    try {
      var response = await http.get(url);
      var responseJSON = jsonDecode(response.body);
      cryptoStats = responseJSON;
      isCryptoPageLoading = false;
    } catch (e) {
      isCryptoPageLoadingError = true;
    }
    setState(() {});
  }

  // Dark Mode
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

  // Request Cam Permission
  void requestPermission() {
    Permission.camera.request();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCryptoStats();
    requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      // Page 1 - Wallet
      ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        primary: true,
        children: [
          // Hello
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 0.0, left: 40.0),
            child: Text(
              "Hello 👋",
              style: TextStyle(
                fontSize: 30.0,
                color: primaryTextColor,
              ),
            ),
          ),
          // Card
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            decoration: BoxDecoration(
              //color: Colors.greenAccent.withOpacity(0.3),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: cardGradient,
              ),
            ),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 70.0),
              decoration: BoxDecoration(
                //color: Color(0xff1c1d2f).withOpacity(0.8),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Total Balance",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "\$78,456",
                    style: TextStyle(
                      fontSize: 38.0,
                      color: primaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 13.0),
                ],
              ),
            ),
          ),
          // Actions
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 15.0),
                // Send
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "transactionPage",
                      arguments: {
                        "isDarkMode": isDarkMode,
                        "appBarTitle": "Send Money",
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          color: secondaryContainerBG,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.0),
                          ),
                        ),
                        child: Icon(
                          Icons.send,
                          color: primaryIconColor,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Send",
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                // Recieve
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "transactionPage",
                      arguments: {
                        "isDarkMode": isDarkMode,
                        "appBarTitle": "Receive Money",
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          color: secondaryContainerBG,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.0),
                          ),
                        ),
                        child: Icon(
                          Icons.file_download_outlined,
                          color: primaryIconColor,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Recieve",
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                // Exchange
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "transactionPage",
                      arguments: {
                        "isDarkMode": isDarkMode,
                        "appBarTitle": "Exchange",
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          color: secondaryContainerBG,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.0),
                          ),
                        ),
                        child: Icon(
                          Icons.wifi_protected_setup_rounded,
                          color: primaryIconColor,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Swap",
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                // QR Code
                GestureDetector(
                  onTap: () {
                    /*Navigator.pushNamed(
                      context,
                      "qrScannerPage",
                      arguments: {
                        "isDarkMode": isDarkMode,
                        "appBarTitle": "QR Scanner",
                      },
                    );*/
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const QRViewExample(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          color: secondaryContainerBG,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.0),
                          ),
                        ),
                        child: Icon(
                          Icons.qr_code_scanner_outlined,
                          color: primaryIconColor,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Scan",
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15.0),
              ],
            ),
          ),
          // Prices
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0, bottom: 10.0),
            child: Text(
              "Prices",
              style: TextStyle(
                fontSize: 15.0,
                color: secondaryTextColor,
              ),
            ),
          ),
          // Stats
          isCryptoPageLoading == false
              ? Container(
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: cryptoStats.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: secondaryContainerBG,
                              borderRadius: BorderRadius.all(
                                Radius.circular(0.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Image, Name and symbol
                                Row(
                                  children: [
                                    // Image
                                    SizedBox(
                                      width: 35.0,
                                      child: Image.network(
                                        cryptoStats[index]["image"],
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    // Name and Symbol
                                    Container(
                                      width: 120.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Name
                                          Text(
                                            cryptoStats[index]["name"],
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: primaryTextColor,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(height: 4.0),
                                          // Symbol
                                          Text(
                                            cryptoStats[index]["symbol"],
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: primaryTextColor
                                                  .withOpacity(0.4),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // Daily High and Low Price
                                Container(
                                  width: 80.0,
                                  child: Column(
                                    children: [
                                      // High
                                      Text(
                                        cryptoStats[index]["high_24h"]
                                            .toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.green,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      // Low
                                      Text(
                                        cryptoStats[index]["low_24h"]
                                            .toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.redAccent,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Current Price
                                Container(
                                  width: 100.0,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "\$" +
                                        cryptoStats[index]["current_price"]
                                            .toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: primaryTextColor.withOpacity(0.8),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 0.1,
                            color: tirtiaryTextColor.withOpacity(0.1),
                          ),
                        ],
                      );
                    },
                  ),
                )
              : Container(
                  height: 100.0,
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  ),
                ),
          // Space
          const SizedBox(height: 200.0),
        ],
      ),
      // Page 2 - History
      ListView(
        children: [
          // Page Title
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 0.0, left: 10.0),
            child: Row(
              children: [
                Icon(
                  Icons.history,
                  color: primaryIconColor,
                ),
                const SizedBox(width: 10.0),
                Text(
                  "History",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: cryptoHistory.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30.0),
                    // Date
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        cryptoHistory[index]["date"].toString(),
                        style: TextStyle(
                          color: secondaryTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // Sent / Received and Amount
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: secondaryContainerBG,
                        borderRadius: BorderRadius.all(
                          Radius.circular(0.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Sent / Received
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    cryptoHistory[index]["sent"] == true
                                        ? Icons.file_upload_outlined
                                        : Icons.file_download_outlined,
                                    color: primaryIconColor,
                                    size: 30.0,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Sent / Received
                                      Text(
                                        cryptoHistory[index]["sent"] == true
                                            ? "Sent"
                                            : "Received",
                                        style: TextStyle(
                                          color: primaryTextColor,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      // Address
                                      Row(
                                        children: [
                                          Text(
                                            cryptoHistory[index]["sent"] == true
                                                ? "To:"
                                                : "From:",
                                            style: TextStyle(
                                              color: secondaryTextColor,
                                            ),
                                          ),
                                          const SizedBox(width: 4.0),
                                          SizedBox(
                                            width: 180.0,
                                            child: Text(
                                              cryptoHistory[index]["address"],
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: secondaryTextColor,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Amount
                          Row(
                            children: [
                              Text(
                                (cryptoHistory[index]["sent"] == true
                                        ? "- "
                                        : "+ ") +
                                    cryptoHistory[index]["amount"].toString(),
                                style: TextStyle(
                                  color: cryptoHistory[index]["sent"] == true
                                      ? Colors.redAccent
                                      : (isDarkMode == true
                                          ? Colors.greenAccent
                                          : Colors.green),
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                cryptoHistory[index]["symbol"],
                                style: TextStyle(
                                  color: primaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      // Page 3 - Setting
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80.0),
            // Profile
            Column(
              children: [
                Container(
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 100.0,
                    color: primaryIconColor,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Dagmawi Babi",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: primaryTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            // Options
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: secondaryContainerBG.withOpacity(0.8),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.dark_mode, color: primaryIconColor),
                      const SizedBox(width: 10.0),
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                          color: primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      isDarkMode = value;
                      darkMode();
                    },
                  ),
                ],
              ),
            ),
            //const SizedBox(height: 200.0),
            const Spacer(),
            Text(
              "Made with 🖤 Dream Intelligence",
              style: TextStyle(
                fontSize: 12.0,
                color: primaryTextColor.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: scaffoldBG,
      body: pages[curPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bottomNavBarBG,
        unselectedItemColor: Colors.grey[700],
        selectedLabelStyle: TextStyle(fontSize: 13.0),
        currentIndex: curPage,
        onTap: (value) {
          curPage = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: "Wallet",
            icon: Icon(
              Icons.account_balance_wallet_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "History",
            icon: Icon(
              Icons.history,
            ),
          ),
          BottomNavigationBarItem(
            label: "Setting",
            icon: Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff191a2c),
        child: Column(
          children: <Widget>[
            Expanded(flex: 4, child: _buildQrView(context)),
            Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    if (result != null)
                      Text(
                        'Barcode Type: ${describeEnum(result!.format)} \nData: ${result!.code}',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                        child: Text(
                          'Scan',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                await controller?.toggleFlash();
                                setState(() {});
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color(0xff1c1d2f),
                                ),
                                fixedSize: MaterialStateProperty.all(
                                  Size(50.0, 10.0),
                                ),
                              ),
                              child: FutureBuilder(
                                future: controller?.getFlashStatus(),
                                builder: (context, snapshot) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      Icon(
                                        snapshot.data == true
                                            ? Icons.flashlight_on
                                            : Icons.flashlight_off,
                                        size: 14.0,
                                      ),
                                    ],
                                  );
                                },
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                await controller?.flipCamera();
                                setState(() {});
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color(0xff1c1d2f),
                                ),
                                fixedSize: MaterialStateProperty.all(
                                  Size(50.0, 10.0),
                                ),
                              ),
                              child: FutureBuilder(
                                future: controller?.getCameraInfo(),
                                builder: (context, snapshot) {
                                  if (snapshot.data != null) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                          ),
                                        ),
                                        Icon(
                                          Icons.flip_camera_android,
                                          size: 14.0,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const Text('loading');
                                  }
                                },
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
