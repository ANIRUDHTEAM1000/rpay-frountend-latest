// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/splash2.dart';

class RakutenUserLogin extends StatelessWidget {
  const RakutenUserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 150),
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.only(left: 120, right: 120, bottom: 30),
                color: const Color.fromARGB(0, 216, 36, 36),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/RakutenPay.jpg",
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Ok, let's log in to your acoount",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: Column(children: [
                  TextField(
                      decoration: const InputDecoration(
                        labelText: 'Your Email Address',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 30.0),
                      ),
                      onChanged: (value) {}),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 30.0),
                      ),
                      onChanged: (value) {}),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        var a = () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomeUser()));
                        a();
                      },
                      child: Wrap(
                        children: const <Widget>[
                          Text("Log-In",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.login,
                            color: Colors.green,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: const Text("Forgot my email address",
                                style: TextStyle(color: Colors.blue)),
                            onTap: () {
                              print("Forgot my email");
                            },
                          ),
                          GestureDetector(
                            child: const Text("Forgot my password",
                                style: TextStyle(color: Colors.blue)),
                            onTap: () {
                              print("Forgot my password");
                            },
                          )
                        ]),
                  )
                ]),
              )
            ],
          ),
        ),
      )),
    );
  }
}
