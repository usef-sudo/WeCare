import 'dart:convert';

import 'package:amazone_teckathon/Models/Charity.dart';
import 'package:amazone_teckathon/Models/Event.dart';
import 'package:amazone_teckathon/main.dart';
import 'package:amazone_teckathon/pages/Login.dart';
import 'package:amazone_teckathon/shared.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

String _password;
String _email;

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    // TODO: implement initState

    getevents();
    getchrities();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(242, 247, 251, 1),
        body: Form(
          //R key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Image.asset('images/wecare.jpeg'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    // color: Colors.amberAccent[100],
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              child: Center(
                                child: Text(
                                  "Welcome to WeCare where \n       giving has no limits",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 22),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  elevation: 5,
                                  // shadowColor: Colors.blue,
                                  color: Colors.blue[50],
                                  child: TextFormField(
                                    //  textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Icon(Icons.email),
                                      ),
                                      hintText: 'Email : ',
                                    ),
                                    validator: (val) => val.length < 1
                                        ? 'please enter your email.'
                                        : null,

                                    onChanged: (val) => _email = val,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            /*  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.lock),
                                      Text(
                                        "Password: ",

                                        style: TextStyle(color: Colors.black),
                                        textAlign: TextAlign.end, // has impact
                                      ),
                                    ],
                                  ),
                                ),*/
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  elevation: 5,
                                  child: TextFormField(
                                    obscureText: true,
                                    //  textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      icon: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Icon(Icons.lock),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Password :',
                                      //hintText: 'Password:',
                                    ),
                                    validator: (val) => val.length < 6
                                        ? 'Password too short.'
                                        : null,
                                    onChanged: (val) => _password = val,
                                  ),
                                  // shadowColor: Colors.blue,
                                  color: Colors.blue[50],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                      width: 150,
                                      height: 50,
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            side: BorderSide(
                                                color: Colors.black
                                                    .withOpacity(0.3))),
                                        padding: EdgeInsets.all(8),
                                        color: Colors.blue[50],
                                        child: Text(
                                          "REGISTER",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                        onPressed: () => {
                                          print(_email),
                                          print(_password),
                                          // _password="",
                                          // _email="",
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()),
                                          )
                                        },
                                      )),
                                  Container(
                                      height: 50,
                                      width: 150,
                                      child: FlatButton(
                                        highlightColor: Colors.white38,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            side: BorderSide(
                                                color: Colors.black
                                                    .withOpacity(0.3))),
                                        padding: EdgeInsets.all(8),
                                        color: Colors.blue[50],
                                        child: Text(
                                          "Login",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                        onPressed: () => {loguser()},
                                      ))
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    height: 430,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loguser() async {
    Map<String, String> headers = {};
    headers['Content-Type'] = "application/json";
    var body;
    body = json.encode({
      "email": _email,
      "password": _password,
      "nickName": "fname",
      "age": 20
    });
    String url;
    url = "https://localhost:44326/api/users/myUser";
    final response = await http.post(
      url,
      body: body,
      headers: headers,
    );
    print(url);
    //if (response.statusCode == 200) {
    if (true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Golden()),
      );
    } else {
      AwesomeDialog(
        dialogType: DialogType.ERROR,
        context: context,
        width: MediaQuery.of(context).size.width / 1.2,
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Sorry',
        desc: 'Please check you data and try again ',
      )..show();
      throw Exception('Failed to load item');
    }
  }
}

void getchrities() async {
  String url = "https://localhost:44326/api/charities";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    print(data.toString());

    if (charities.length < 1)
      for (int i = 0; i < data.length; i++) {
        Charity obj = Charity.fromJson(data[i]);

        charities.add(obj);
      }
  } else {
    throw Exception('yousef Failed to loud ');
  }
}

void getevents() async {
  String url = "https://localhost:44326/api/events";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    print(data.toString());

    if (charities.length < 1)
      for (int i = 0; i < data.length; i++) {
        Event obj = Event.fromJson(data[i]);

        events.add(obj);
      }
  } else {
    throw Exception('yousef Failed to loud ');
  }
}
