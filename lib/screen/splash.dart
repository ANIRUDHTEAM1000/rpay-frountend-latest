import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/HomeScreen.dart';
import 'dart:async';

import 'accountType.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const AccountTypeSelection())));
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
                    const EdgeInsets.only(left: 120, right: 120, bottom: 30),
                color: const Color.fromARGB(0, 216, 36, 36),
                child: Image.asset(
                  "assets/images/RakutenPay.jpg",
                  fit: BoxFit.contain,
                ),
              ),
              const Text("Let's  get  started",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ]),
      ),
    );
  }
}


// Scaffold(
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 padding:
//                     const EdgeInsets.only(left: 120, right: 120, bottom: 30),
//                 color: const Color.fromARGB(0, 216, 36, 36),
//                 child: Image.asset(
//                   "assets/images/RakutenPay.jpg",
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               const Text("Let's  get  started",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             ]),
//       ),
//     );
//