import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/Account.dart';
import 'package:flutter_application_1/screen/ConfirmPayment.dart';
import 'package:flutter_application_1/screen/EnterAmount.dart';
import 'package:flutter_application_1/screen/HomeScreen.dart';
import 'package:flutter_application_1/screen/RakutenUSerLogin.dart';
import 'package:flutter_application_1/screen/ScanQR.dart';
import 'package:flutter_application_1/screen/SearchPage.dart';
import 'package:flutter_application_1/screen/TransactionComplete.dart';
import 'package:flutter_application_1/screen/TransactionIncomplete.dart';
import 'package:flutter_application_1/screen/qrcodepage.dart';
import 'package:flutter_application_1/screen/splash.dart';
import 'package:flutter_application_1/screen/splash2.dart';

String receiverUid = "";
String receiverName = "";

void main() => runApp(MyApp());
const primaryColor = Color(0xFFFFFFFF);
dynamic res = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rpay Home!',
        color: Colors.white,
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        home: Splash(),

        // adding routes to access all pages from account page
        routes: <String, WidgetBuilder>{
          "/HomeScreen": (BuildContext context) => HomeScreen(),
          "/Account": (BuildContext context) => Account(),
          "/SearchPage": (BuildContext context) => const SearchPage(),
          "/EnterAmount": (BuildContext context) => const EnterAmount(),
          "/TransactionComplete": (BuildContext context) =>
              const TransactionComplete(),
          "/TransactionIncomplete": (BuildContext context) =>
              const TransactionIncomplete(),
          "/qrcodepage": (BuildContext context) => const qrcodepage(),
          "/ConfirmPayment": (BuildContext context) => const ConfirmPayment(),
          "/welcomeSplash": (BuildContext context) => const WelcomeUser(),
          "/RakutenUSerLogin": (BuildContext context) =>
              const RakutenUserLogin(),
          "/ScanQR": (BuildContext context) => ScanQrPage(),
          //add more pages based on the need similarly
        });
  }
}
