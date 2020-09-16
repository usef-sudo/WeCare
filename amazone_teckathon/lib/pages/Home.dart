import 'package:amazone_teckathon/shared.dart';
import 'package:amazone_teckathon/tabs/FirstScreen.dart';
import 'package:amazone_teckathon/tabs/SecondScreen.dart';
import 'package:flutter/material.dart';

import 'Notifications.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeCare ',
            style: TextStyle(fontSize: 25, color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationCenter())),
                  },
                  child: Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 36.0,
                  ),
                ),
                if (notif.length > 0)
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Text(
                        notif.length.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.blue[100],
      ),
      body: ListView(
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstScreen())),
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 500,
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Donate', //  'you can donate any kind of material that you are not using Make impact now !!!!',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "you can donate any kind of material that you are not using Make impact now "),
                        ),
                        Container(
                          height: 180,
                          child: Image.asset('images/DONATE.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen())),
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 500,
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Request', // 'Dont be shy!!! if you need any donation or if you know any poor people just ask us now!!! ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Dont be shy!!! if you need any donation or if you know any poor people just ask us now"),
                        ),
                        Container(
                          height: 180,
                          child: Image.asset('images/requist.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
