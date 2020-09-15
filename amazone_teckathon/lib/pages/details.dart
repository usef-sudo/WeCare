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
                          )
                        ],
                      ))),
                )
          ],
        ),
      ),
    );
  }
}
