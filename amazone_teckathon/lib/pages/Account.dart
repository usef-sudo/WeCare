import 'package:amazone_teckathon/pages/About.dart';
import 'package:amazone_teckathon/pages/Call.dart';
import 'package:amazone_teckathon/pages/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final GlobalKey<ScaffoldState> _DKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _DKey,
      endDrawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.blue[100],
              height: 57,
            ),
            InkWell(
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Call()),
                )
              },
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome()),
                )
              },
              child: ListTile(
                leading: Icon(Icons.lock_open),
                title: Text("LogOut"),
              ),
            ),
            Divider()
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(242, 247, 251, 1),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Account",
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.blue[100],
        actions: <Widget>[
          InkWell(
              onTap: () => {_DKey.currentState.openEndDrawer()},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Image.asset('images/wecare.jpeg'),
              ),
            ),
            Center(
              child: Text(
                "MAKE IMPACT 💞",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Support",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 40,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black)),
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text("ABOUT WeCare "),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => About()),
                    )
                  },
                )),
            SizedBox(
              height: 15,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 40,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black)),
                  child: ListTile(
                    leading: Icon(Icons.share),
                    title: Text("Invite frinds to use WeCare"),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  onPressed: () =>
                      {Share.share("test", subject: "subject")}, //todo:
                )),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
