import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/HomeScreen.dart';
import 'package:flutter_application_1/screen/Navbar.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'package:intl/intl.dart';

dynamic getBalance() async {
  var url = "10.0.2.2:8080";
  final response = await http.get(Uri.http(url, "walletengine/balance/" + uid));

  if (response.statusCode == 200) {
    balance = int.parse(response.body.toString());
    return '';
  }
}

// ignore: must_be_immutable
class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);
  String bal = NumberFormat.decimalPattern('en_us').format(balance);
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: [
            TextButton(
              child: const Text("Refresh"),
              onPressed: () async {
                await getBalance();
                bal = NumberFormat.decimalPattern('en_us').format(balance);
                Navigator.of(context).pushNamed(
                    "/Account" /* Name of the page from the routes used  */);
              },
            ),
          ],
          backgroundColor: primaryColor,
          title: Image.asset(
            "assets/images/RakutenPay.jpg",
            alignment: Alignment.center,
            fit: BoxFit.cover,
            height: 30,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hi ${uname} ,  ',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text('\$ $bal in RPay\n\n',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton.extended(
                    heroTag: "hero2",
                    foregroundColor: Colors.white,
                    label: const Text("Scan QR"),
                    icon: const Icon(Icons.qr_code),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      print(
                          "opening camera"); //what should be done on pressing .
                          Navigator.of(context).pushNamed(
                    "/ScanQR" /* Name of the page from the routes used  */
                    );
                    },
                  ),
                  FloatingActionButton.extended(
                    heroTag: "hero3",
                    foregroundColor: Colors.white,
                    label: const Text("Pay/Recieve"),
                    icon: const Icon(Icons.payments),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          "/SearchPage" /* Name of the page from the routes used  */); // what should be done on pressing .
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
