import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => {Navigator.pop(context)},
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.blue[100],
            title: Center(
              child: Text(
                " ABOUT US",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                    child: Text(
                  "WeCare App is a one of kind mobile app that targets all people all around the word to donate there furnature ,clothes and any good things that they dont need any more as well as letting poor people requist what ever they need connecting them with charties that work to help them all the time .",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ),
            ],
          )),
    );
  }
}
