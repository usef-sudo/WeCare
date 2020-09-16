import 'dart:convert';
import 'package:amazone_teckathon/pages/Welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

bool _obscureText = true;

String _passwordd;
String _emaill;
String _fname;
String _age;

final _formKey2 = GlobalKey<FormState>();

// Toggles the password show status

class _LoginState extends State<Login> {
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(242, 247, 251, 1),
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
            "Create Account",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
        ),
        body: Form(
          key: _formKey2,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 5,
                        shadowColor: Colors.blue,
                        color: Colors.blue[50],
                        child: TextFormField(
                          validator: (val) => val.length < 1
                              ? 'please enter your email.'
                              : null,
                          onChanged: (val) => _emaill = val,

                          //  textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email : ',
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.email),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 5,
                        child: TextFormField(
                          validator: (val) =>
                              val.length < 6 ? 'Password too short.' : null,
                          onChanged: (val) => _passwordd = val,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password :',
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.lock),
                            ),
                          ),
                        ),
                        shadowColor: Colors.blue,
                        color: Colors.blue[50],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 5,
                        child: TextFormField(
                          //  textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.person),
                            ),
                            hintText: 'Name : ',
                          ),
                          validator: (val) =>
                              val.length < 1 ? 'please enter your name.' : null,
                          onChanged: (val) => _fname = val,
                        ),
                        shadowColor: Colors.blue,
                        color: Colors.blue[50],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 5,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (val) =>
                              val.length < 1 ? 'please enter your age.' : null,
                          onChanged: (val) => _age = val,
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.people),
                            ),
                            border: InputBorder.none,
                            hintText: 'Age :',
                          ),
                        ),
                        shadowColor: Colors.blue,
                        color: Colors.blue[50],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            height: 50,
                            width: 150,
                            child: FlatButton(
                              highlightColor: Colors.white38,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      color: Colors.black.withOpacity(0.3))),
                              padding: EdgeInsets.all(8),
                              color: Colors.blue[50],
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.black87),
                              ),
                              onPressed: () => {

                                if (_formKey2.currentState.validate())
                                  {
                                    print(_emaill),
                                    print(_fname),
                                    print(_passwordd),
                                    print(_age),

                                    _age = "",
                                    _emaill = "",
                                    _fname = "",
                                    _age = "",

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Welcome()),
                                    ),
                                    // open if connected to server     createuser(),
                                  }
                              },
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createuser() async {
    Map<String, String> headers = {};
    headers['Content-Type'] = "application/json";
    var body;
    body = json.encode({
      "email": _emaill,
      "password": _passwordd,
      "nickName": _fname,
      "age": _age
    });
    String url;
    url = "https://localhost:44326/api/users";
    final response = await http.post(
      url,
      body: body,
      headers: headers,
    );
    print(url);
    if (response.statusCode == 200) {
      print(response.body.toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Welcome()),
      );
    } else {
      throw Exception('Failed to load item');
    }
  }
}
