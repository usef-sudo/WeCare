import 'package:amazone_teckathon/Models/Charity.dart';
import 'package:flutter/material.dart';

String _email;
String _password;
int pay;

class Details extends StatefulWidget {
  final Charity theone;
  const Details(this.theone);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => {Navigator.pop(context)},
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.blue[100],
          title: Center(
            child: Text(
              widget.theone.name,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: ListView(
          children: [
            // Image.file(theone.logo),
            //image
            SizedBox(
              height: 20,
            ),

            Text(
              "About us :",
              style: TextStyle(fontSize: 22),
            ),

            SizedBox(
              height: 20,
            ),
            Text(
              widget.theone.discription,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Contact us throw :"), Text(widget.theone.email)],
            ),
            SizedBox(
              height: 20,
            ),

            Divider(
              height: 3,
            ),
            SizedBox(
              height: 20,
            ),

            Center(
              child: Text(
                "In Prosses",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            if (widget.theone.charitydonations != null)
              for (int i = 0; i < widget.theone.charitydonations.length; i++)
                Container(
                  height: 100,
                  color: Colors.blue[50],
                  child: Card(
                      color: Colors.blue[50],
                      child: Center(
                          child: Column(
                        children: [
                          Text(widget.theone.charitydonations[i].location),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                                widget.theone.charitydonations[i].discription),
                          ),
                          Center(
                            child: FlatButton(
                              color: Colors.white,
                              child: Text(
                                "${widget.theone.charitydonations[i].inprosses}/${widget.theone.charitydonations[i].money}",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              height: 50,
                              width: 150,
                              child: InkWell(
                                onTap: () {
                                  String _email;
                                  String _password;
                                  showDialog(
                                    context: context,
                                    child: new Dialog(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          height: 550,
                                          child: Form(
                                            key: _formkey,
                                            child: new ListView(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Image.network(
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSI8042LGmOZY0zYA0q81pz9LgshhG8aRCotcLz6OBevw&usqp=CAU&ec=45699843'),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            10,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Card(
                                                      elevation: 5,
                                                      // shadowColor: Colors.blue,
                                                      color: Colors.blue[50],
                                                      child: TextFormField(
                                                        //  textAlign: TextAlign.right,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          icon: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            child: Icon(
                                                                Icons.email),
                                                          ),
                                                          hintText: 'Email : ',
                                                        ),
                                                        validator: (val) => val
                                                                    .length <
                                                                1
                                                            ? 'please enter your email.'
                                                            : null,

                                                        onChanged: (val) =>
                                                            _email = val,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            10,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Card(
                                                      elevation: 5,
                                                      child: TextFormField(
                                                        obscureText: true,
                                                        //  textAlign: TextAlign.right,
                                                        decoration:
                                                            InputDecoration(
                                                          icon: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            child: Icon(
                                                                Icons.lock),
                                                          ),
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              'Password :',
                                                          //hintText: 'Password:',
                                                        ),
                                                        validator: (val) => val
                                                                    .length <
                                                                6
                                                            ? 'Password too short.'
                                                            : null,
                                                        onChanged: (val) =>
                                                            _password = val,
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            10,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Card(
                                                      elevation: 5,
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        decoration:
                                                            InputDecoration(
                                                          icon: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            child: Icon(Icons
                                                                .attach_money),
                                                          ),
                                                          border:
                                                              InputBorder.none,
                                                          hintText: 'Amount :',
                                                          //hintText: 'Password:',
                                                        ),
                                                        validator: (val) => int
                                                                    .parse(
                                                                        val) >
                                                                widget
                                                                        .theone
                                                                        .charitydonations[
                                                                            i]
                                                                        .money -
                                                                    widget
                                                                        .theone
                                                                        .charitydonations[
                                                                            i]
                                                                        .inprosses
                                                            ? 'we dont need this amount'
                                                            : null,
                                                        onChanged: (val) =>
                                                            pay =
                                                                int.parse(val),
                                                      ),
                                                      // shadowColor: Colors.blue,
                                                      color: Colors.blue[50],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Card(
                                                  elevation: 10,
                                                  child: new FlatButton(
                                                      child:
                                                          new Text("Pay now"),
                                                      onPressed: () {
                                                        if (_formkey
                                                            .currentState
                                                            .validate())
                                                          setState(() {
                                                            widget
                                                                .theone
                                                                .charitydonations[
                                                                    i]
                                                                .inprosses += pay;
                                                            Navigator.of(
                                                                    context,
                                                                    rootNavigator:
                                                                        true)
                                                                .pop();
                                                          });
                                                      }),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  color: Colors.white,
                                  child: Center(child: Text("Donate Now")),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ))),
                )
          ],
        ),
      ),
    );
  }
}
