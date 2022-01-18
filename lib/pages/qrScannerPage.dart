import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() => runApp(MaterialApp(home: QRScannerPage()));

class QRScannerPage extends StatelessWidget {
  QRScannerPage({Key? key}) : super(key: key);

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
        title: Text(
          appBarTitle,
        ),
        backgroundColor: appBarBG,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },
          child: const Text('qrView'),
        ),
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
    dynamic receivedData = ModalRoute.of(context)!.settings.arguments;
    isDarkMode = receivedData["isDarkMode"];
    String appBarTitle = receivedData["appBarTitle"];
    darkMode();
    return Scaffold(
      backgroundColor: scaffoldBG,
      body: Column(
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
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    Text(
                      'Scan a code',
                      style: TextStyle(
                        color: primaryTextColor,
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data!)}');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
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
