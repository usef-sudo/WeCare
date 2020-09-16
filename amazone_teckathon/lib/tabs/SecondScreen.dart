import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

final _formKey = GlobalKey<FormState>();

String _location;
String _description;
String _phone;

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => {
                  AwesomeDialog(
                    dialogType: DialogType.INFO,
                    context: context,
                    width: MediaQuery.of(context).size.width / 1.2,
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'About Request',
                    desc:
                        'Feel free to share with us your needs or any humanity cases you knew by filling this page form and press request.',
                  )..show()
                },
                child: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
              ),
            )
          ],
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
            "Requist ",
            style: TextStyle(color: Colors.black),
          )),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
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
                      keyboardType: TextInputType.number,

                      onChanged: (val) => _phone = val,
                      validator: (val) =>
                          val.length < 1 ? 'please enter phone number' : null,

                      //  textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.call),
                        ),
                        hintText: 'Phone : ',
                      ),
                    ),
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
                    child: TextFormField(
                      onChanged: (val) => _location = val,

                      validator: (val) =>
                          val.length < 1 ? 'please enter location' : null,

                      //  textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.add_location),
                        ),
                        hintText: 'Location :',
                      ),
                    ),
                    shadowColor: Colors.blue,
                    color: Colors.blue[50],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Discription :",

                    textAlign: TextAlign.end, // has impact
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    color: Colors.blue[50], //Colors.blueGrey,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (val) => _description = val,
                        maxLines: 5,
                        decoration: InputDecoration.collapsed(
                            hintText: "discripe the thing you need"),
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "select the Type of need :",

                        textAlign: TextAlign.end, // has impact
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  MyStatefulWidget(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black.withOpacity(0.3))),
                  onPressed: () {
                    if (_formKey.currentState.validate())
                      AwesomeDialog(
                        dialogType: DialogType.SUCCES,
                        context: context,
                        width: MediaQuery.of(context).size.width / 1.2,
                        headerAnimationLoop: false,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'Done',
                        desc:
                            'Carring about each other represent life\'s greatest value don\'t worry we are here for you.',
                      )..show();
                    // Navigator
                  },
                  child: Center(
                    child: Text(
                      "Request",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  color: Colors.blue[50],
                ),
              )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void godonate() async {
    Map<String, String> headers = {};
    headers['Content-Type'] = "application/json";
    var body;
    body = json.encode({
      {
        "phone": _phone,
        "discreption": _description,
        "location": _location,
        "type": dropdownValue,
        "available": true
      }
    });
    String url;
    url = "https://localhost:44326/api/requests";
    final response = await http.post(
      url,
      body: body,
      headers: headers,
    );
    print(url);
    if (response.statusCode == 200) {
      AwesomeDialog(
        dialogType: DialogType.SUCCES,
        context: context,
        width: MediaQuery.of(context).size.width / 1.2,
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Done',
        desc: 'You spread hop in life by what you give Thank you. ',
      )..show();
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

String dropdownValue = 'Another';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue[100],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Another',
        'Medical',
        'Study',
        'Hummenity',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
