import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

dynamic uid = "";
dynamic uname = "";
int balance = 0;

dynamic getUserfromInfo(contact) async {
  var url = "10.0.2.2:8080";
  final response =
      await http.get(Uri.http(url, "walletengine/user/" + contact));
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    balance = jsonResponse["balance"];
    uname = jsonResponse["name"];
    uid = jsonResponse["user_login_id"];

    print("async call " + uname + uid + balance.toString());
    return jsonResponse;
  }
}

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  String userId = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 75,
                  child: Image.asset(
                    "assets/images/RakutenPay.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'User ID',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  onChanged: (value) {
                    userId = value;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5.0, left: 30, right: 30),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: 150,
                  height: 50,
                  child: FloatingActionButton.extended(
                    heroTag: "Hero6",
                    foregroundColor: Colors.white,
                    label: const Text("Login"), //remove the variable
                    icon: const Icon(Icons.login),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () async {
                      await getUserfromInfo(userId);
                      print(uname + uid + balance.toString());
                      Navigator.of(context).pushNamed(
                          "/Account" /* Name of the page from the routes used  */
                          );
                    },
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
