// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screen/Navbar.dart';
import 'HomeScreen.dart';


class User {
  late String name;
  late String userLoginId;
  User(this.name, this.userLoginId);
}

List<User> li = [];

dynamic getUserfromQuery(String query) async {
  var url = "10.0.2.2:8080";
  final response =
      await http.get(Uri.http(url, "walletengine/user/query/" + query));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    var u = jsonResponse['users'];
    li.clear();
    print("In function getUserFRomQuery query is " + query);
    if (query == "" || query == null) {
      print("li from function ");
      print(li);
      return;
    }
    for (int i = 0; i < u.length; i++) {
      User obj = User(u[i]["name"], u[i]["user_login_id"]);
      if (u[i]["name"] != uname) {
        li.add(obj);
      }
    }
    print("li from function ");
    print(li);
  }
}

// CREATING A STATEFUL WIDGET HERE
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  int c = 0;
  @override
  Widget build(BuildContext context) {
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
          Center(
            child: TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        backgroundColor: primaryColor,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Autocomplete<User>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  for (int i = 0; i < li.length; i++) {
                    if (li[i].name == uname.toString()) {
                      li.remove(li[i]);
                    }
                  }
                  print("from auto complete ");
                  return li
                      .where((User user) => user.name
                          .toLowerCase()
                          .startsWith(textEditingValue.text.toLowerCase()))
                      .toList();
                },
                displayStringForOption: (User option) => option.name,
                fieldViewBuilder: (BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    onChanged: (query) async {
                      print("query is " + query);
                      await getUserfromQuery(query.toString());
                      setState(() {});
                      print("li from onChange ");
                      print(li);
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      labelText: 'Search for User',
                      hintText: 'Enter User Name / Rakuten Pay ID',
                    ),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  );
                },
                onSelected: (User selection) {
                  receiverName = selection.name;
                  receiverUid = selection.userLoginId;
                  print('Selected: $receiverName $receiverUid');
                },
                optionsViewBuilder: (BuildContext context,
                    AutocompleteOnSelected<User> onSelected,
                    Iterable<User> options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      child: Container(
                        child: Scrollbar(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10.0),
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final User option = options.elementAt(index);
                              return GestureDetector(
                                onTap: () {
                                  onSelected(option);
                                  Navigator.of(context)
                                      .pushNamed("/EnterAmount");
                                },
                                child: ListTile(
                                  title: Text(option.name,
                                      style:
                                          const TextStyle(color: Colors.black)),
                                ),
                              );
                            },
                          ),
                          isAlwaysShown: false,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
            heroTag: "hero8",
            backgroundColor: Colors.red,
            onPressed: () {
              print("opening camera...");
              Navigator.of(context).pushNamed(
                  "/ScanQR" /* Name of the page from the routes used  */
                  );
            },
            icon: const Icon(Icons.qr_code_2),
            label: const Text("Pay using QR"),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
