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
                    title: 'About Requist',
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
              //HEOUT
              /*
 new Container(
                    height: 50.0,
                    child: InkWell(
                      onTap: () => {},
                      child: new Carousel(
                        boxFit: BoxFit.cover,
                        images: [

flag ? Image.network('https://miro.medium.com/fit/c/1838/551/1*BVtmC_VYb0v8qtmlf--K9Q.jpeg'):Image.network('https://miro.medium.com/fit/c/1838/551/1*BVtmC_VYb0v8qtmlf--K9Q.jpeg'),

                        ],
                        autoplay: true,
                        animationCurve: Curves.fastOutSlowIn,
                        animationDuration: Duration(milliseconds: 500),
                        dotSize: 0.0,
                        indicatorBgPadding: 0.0,
                      ),
                    ),
                  ),*/
              /*    Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: flag
                      ? Image.network(
                          'https://miro.medium.com/fit/c/1838/551/1*BVtmC_VYb0v8qtmlf--K9Q.jpeg')
                      : Image.network(
                          'https://miro.medium.com/fit/c/1838/551/1*BVtmC_VYb0v8qtmlf--K9Q.jpeg'),
                ),
              ),
*/
              SizedBox(
                height: 20,
              ),
              /*  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Phone: ",

                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.end, // has impact
                  ),
                ),
              ),*/
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
              /*  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Location :",
                    textAlign: TextAlign.end, // has impact
                    style: TextStyle(color: Colors.black),
                  ),
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

///////////////////////////////////////////////////////////////////////////////////
/*
            Container(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: flag
                      ? Image.network(
                          'data:image/png;base64,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')
                      : Image.network(
                          'data:image/png;base64,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'),
              ),
            ),
*/
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
    url = "******/api/requests";
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
