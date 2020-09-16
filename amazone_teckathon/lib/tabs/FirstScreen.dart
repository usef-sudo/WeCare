import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io' as Io;
import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

final _formKey = GlobalKey<FormState>();

String _location;
String _description;
String _phone;
bool f = false;
var _image = null;

class _FirstScreenState extends State<FirstScreen> {
  Future getImage(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
        context: context,
        source: source,
        cameraIcon: Icon(
          Icons.camera_alt,
          color: Colors.red,
        ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
        cameraText: Text(
          "From Camera",
          style: TextStyle(color: Colors.red),
        ),
        galleryText: Text(
          "From Gallery",
          style: TextStyle(color: Colors.blue),
        ));
    setState(() {
      _image = image;
    });
  }

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
                    title: 'About Donation',
                    desc:
                        'For any usable items you would like to donate just fill this page form and press Donate.',
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
            "Donation ",
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
                      validator: (val) =>
                          val.length < 1 ? 'please enter phone number' : null,
                      onChanged: (val) => _phone = val,
                      //  textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.call),
                        ),
                        border: InputBorder.none,
                        hintText: 'Phone :  ',
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
                      validator: (val) =>
                          val.length < 1 ? 'please enter items location' : null,
                      onChanged: (val) => _phone = val,

                      //  textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'City/Country :',
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.add_location),
                        ),
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
                            hintText: "discripe the thing you want to donate"),
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "pick up service",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: f,
                        onChanged: (value) => chick(),
                      ),
                      Text("YES"),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: _image == null
                    ? SizedBox(
                        height: 70,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => {
                              getImage(ImgSource.Both),
                            },
                            child: Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.camera_alt),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Take a photo",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              height: 70,
                              width:
                                  MediaQuery.of(context).size.width / 2 - 100,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () => {
                                    getImage(ImgSource.Both),
                                  },
                                  child: Card(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.camera_alt),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width / 2 - 100),
                            child: Image.file(_image),
                          ),
                        ],
                      ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black.withOpacity(0.3))),
                  onPressed: () {
                    if (_formKey.currentState.validate()) godonate();
                    // Navigator
                  },
                  child: Center(
                    child: Text(
                      "Donate",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.black87),
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

  chick() {
    setState(() {
      f = !f;
    });
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
        "pickUp": f,
        "imgData": Io.File(_image).readAsBytes(),
        "available": true
      }
    });
    String url;
    url = "https://localhost:44326/api/donations";
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
