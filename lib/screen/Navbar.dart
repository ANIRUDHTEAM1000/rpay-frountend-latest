import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart';
import 'package:flutter_application_1/screen/HomeScreen.dart';
import 'package:flutter_application_1/screen/Account.dart';

class Navbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("User Name"),
          accountEmail: Text("user@gmail.com"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
                ),
          ),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),
        ListTile(
          leading: Icon(Icons.qr_code),
          title: Text("My QR"),
          onTap: () {
            Navigator.of(context).pushNamed(
                "/qrcodepage" /* Name of the page from the routes used  */); //try to show my qr code ;
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout"),
          onTap: () {
            Navigator.of(context).pushNamed("/HomeScreen");
          },
        ),
      ],
    ));
  }
}
