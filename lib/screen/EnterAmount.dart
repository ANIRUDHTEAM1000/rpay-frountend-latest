import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/Navbar.dart';
import 'package:flutter_application_1/screen/SearchPage.dart';

import 'package:intl/intl.dart';
import 'HomeScreen.dart';
import 'SearchPage.dart' as search;

//Calculator logic
dynamic text = '0';
dynamic finalResult = '';
dynamic result = '';

class EnterAmount extends StatelessWidget {
  const EnterAmount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  //Button Widget
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        //     shape: CircleBorder(),
        shape: const RoundedRectangleBorder(),
        color: btncolor,
        padding: const EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      backgroundColor: Colors.white,
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
            child: const Text("Cancel"),
            onPressed: () {
              search.li.clear();
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: primaryColor,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 60,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 150,
                            height: 60,
                            child: FloatingActionButton.extended(
                              heroTag: "Hero5",
                              onPressed: () {
                                int enteredAmount = int.parse(
                                    text.toString().replaceAll(',', ''));
                                print(uid +
                                    receiverUid +
                                    enteredAmount.toString());
                                if (enteredAmount > balance) {
                                  print("inside if $balance");
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text("Error"),
                                            content: Text(
                                                "Insufficient Funds , your current balance is \$$balance"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      text = text;
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("OK"))
                                            ],
                                          ));
                                } else {
                                  Navigator.of(context).pushNamed(
                                      // "/ConfirmPayment" /* Name of the page from the routes used  */
                                      "/ConfirmPayment");
                                }
                              },
                              backgroundColor: Colors.red,
                              extendedTextStyle: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                              label: const Text("Pay"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('C', Colors.white, Colors.black),
                calcbutton('0', Colors.white, Colors.black),
                calcbutton('.', Colors.white, Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.white, Colors.black),
                calcbutton('2', Colors.white, Colors.black),
                calcbutton('3', Colors.white, Colors.black),
                //              calcbutton('x', Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Colors.white, Colors.black),
                calcbutton('5', Colors.white, Colors.black),
                calcbutton('6', Colors.white, Colors.black),
                //               calcbutton('-', Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Colors.white, Colors.black),
                calcbutton('8', Colors.white, Colors.black),
                calcbutton('9', Colors.white, Colors.black),
                //              calcbutton('+', Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void calculation(btnText) {
    if (btnText == '0' && text == '0') {
      finalResult = '0';
    }
    if (btnText == 'C') {
      text = '0';
      result = '';
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = NumberFormat.decimalPattern('en_us')
          .format(int.parse(finalResult))
          .toString();
    });
    print("printing....");
    print(finalResult);
  }
}


  // String doesContainDecimal(dynamic result) {
  //   if (result.toString().contains('.')) {
  //     List<String> splitDecimal = result.toString().split('.');
  //     if (!(int.parse(splitDecimal[1]) > 0))
  //       return result = splitDecimal[0].toString();
  //   }
  //   return result;
  // }