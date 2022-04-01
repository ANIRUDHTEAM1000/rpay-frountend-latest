import 'package:flutter/material.dart';

class AccountTypeSelection extends StatelessWidget {
  const AccountTypeSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Container(
            padding: const EdgeInsets.only(left: 150, right: 150, bottom: 30),
            color: const Color.fromARGB(0, 216, 36, 36),
            child: Image.asset(
              "assets/images/RakutenPay.jpg",
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: 150,
            width: 400,
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  side: const BorderSide(
                    width: 1.5,
                    color: Colors.black,
                  )),
              onPressed: () {
                Navigator.of(context).pushNamed(
                    "/RakutenUSerLogin" /* Name of the page from the routes used  */
                    );
              },
              child: const Text(
                'Are you already a Rakuten Member and wish to log in with the same email and password',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 150,
            width: 400,
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(
                    width: 1.5,
                    color: Colors.black,
                  )),
              onPressed: () {
                print("No i dont");
                Navigator.of(context).pushNamed(
                    "/HomeScreen" /* Name of the page from the routes used  */
                    );
              },
              child: const Text(
                'No, I don\'t',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
