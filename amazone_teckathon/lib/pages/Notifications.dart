import 'package:flutter/material.dart';

class NotificationCenter extends StatefulWidget {
  @override
  _NotificationCenterState createState() => _NotificationCenterState();
}

class _NotificationCenterState extends State<NotificationCenter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          leading: InkWell(
            onTap: () => {Navigator.pop(context)},
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Center(
              child: Text(
            "NotificationCenter ",
            style: TextStyle(color: Colors.black),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Card(
                  elevation: 10,
                  child: ListTile(
                    title: Text("Dear Yousef"),
                    subtitle: Text("Welcome and thank you for using WeCare"),
                    trailing: Icon(Icons.delete),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
