import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/Account.dart';
import 'dart:async';

import 'package:flutter_application_1/screen/HomeScreen.dart';

class WelcomeUser extends StatefulWidget {
  const WelcomeUser({Key? key}) : super(key: key);

  @override
  State<WelcomeUser> createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      dynamic tempData = '''{
                    "status": 1,
                    "name": "Anirudh G",
                    "user_login_id": "anirudh@rakuten.com",
                    "balance": 8000
                    }''';
      tempData = jsonDecode(tempData);
      balance = tempData["balance"];
      uname = tempData["name"];
      uid = tempData["user_login_id"];
      print(" from user splash " + uname + uid + balance.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Account()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.only(left: 120, right: 120, bottom: 100),
                color: const Color.fromARGB(0, 216, 36, 36),
                child: Image.asset(
                  "assets/images/RakutenPay.jpg",
                  fit: BoxFit.contain,
                ),
              ),
              const Text("Welcome, Luca Tabi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ]),
      ),
    );
  }
}
