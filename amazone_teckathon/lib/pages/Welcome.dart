import 'dart:convert';

import 'package:amazone_teckathon/main.dart';

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
                                        color: Colors.blue,
                                        child: Text(
                                          "REGISTER",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                        onPressed: () => {
                                          print(_email),
                                          print(_password),


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
                                        color: Colors.blue,
                                        child: Text(
                                          "Login",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
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


}




