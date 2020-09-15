
import 'package:amazone_teckathon/Models/Charity.dart';
import 'package:amazone_teckathon/Models/Event.dart';
import 'package:amazone_teckathon/shared.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


class EventListPage extends StatefulWidget {
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {

  final _formkey = GlobalKey<FormState>();

  List<Event> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    events = [
      Event(
          discription:
          "aaaaaaaaaaaaar ttttttttttttttt tttttttttejiponfinojv ijoijogijeorith oijoijoi joioitrj oioi joi joij oij oj aaaaaaaaaaaaaaaa",
          money: 100,
          inprosses: 0,
          name: "onve  t gtrtree",
          owner: Charity(name: "one charity")),
      Event(
          discription: "bbbbbbbbbbbbbbbbbbbbbbbbbbbb",
          money: 200,
          inprosses: 0,
          name: "twervreref 4rfregergf evero",
          owner: Charity(name: "two cha e trb t dqece rity")),
    ];
    searchResults = events;

  }

  int pay = 0;
  int paypal = 0;
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                ),
                onTap: () => {
                  AwesomeDialog(
                    dialogType: DialogType.INFO,
                    context: context,
                    width: MediaQuery.of(context).size.width / 1.2,
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'About Events',
                    desc:
                        'here you can see our charites events please help as you can..',
                  )..show()
                },
              ),
            )
          ],
          backgroundColor: Colors.blue[100],
          title: Center(
              child: Text(
            "Events List ",
            style: TextStyle(color: Colors.black),
          )),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 5),
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.only(left: 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                  ),
                  child: Card(
                    elevation: 10,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search)),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          List<Event> tempList = List<Event>();
                          events.forEach((event) {
                            if (event.name.toLowerCase().contains(value)) {
                              tempList.add(event);
                            }
                          });
                          setState(() {
                            searchResults.clear();
                            searchResults.addAll(tempList);
                          });
                          return;
                        } else {
                          setState(() {
                            searchResults.clear();
                            searchResults.addAll(events);
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (_, index) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                            color: Colors.blue[50],
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 150,
                                        child: Text(
                                          searchResults[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "BY:",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: 150,
                                            child: Text(
                                              searchResults[index].owner.name,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    searchResults[index].discription,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: FlatButton(
                                    color: Colors.white,
                                    child: Text(
                                      "${searchResults[index].inprosses}/${searchResults[index].money}",
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
                                              padding:
                                                  const EdgeInsets.all(12.0),
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
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              10,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: Card(
                                                            elevation: 5,
                                                            // shadowColor: Colors.blue,
                                                            color:
                                                                Colors.blue[50],
                                                            child:
                                                                TextFormField(
                                                              //  textAlign: TextAlign.right,
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                icon: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Icon(
                                                                      Icons
                                                                          .email),
                                                                ),
                                                                hintText:
                                                                    'Email : ',
                                                              ),
                                                              validator: (val) =>
                                                                  val.length < 1
                                                                      ? 'please enter your email.'
                                                                      : null,

                                                              onChanged:
                                                                  (val) =>
                                                                      _email =
                                                                          val,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              10,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: Card(
                                                            elevation: 5,
                                                            child:
                                                                TextFormField(
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
                                                                      Icons
                                                                          .lock),
                                                                ),
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    'Password :',
                                                                //hintText: 'Password:',
                                                              ),
                                                              validator: (val) =>
                                                                  val.length < 6
                                                                      ? 'Password too short.'
                                                                      : null,
                                                              onChanged: (val) =>
                                                                  _password =
                                                                      val,
                                                            ),
                                                            // shadowColor: Colors.blue,
                                                            color:
                                                                Colors.blue[50],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              10,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: Card(
                                                            elevation: 5,
                                                            child:
                                                                TextFormField(
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
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    'Amount :',
                                                                //hintText: 'Password:',
                                                              ),
                                                              validator: (val) => int
                                                                          .parse(
                                                                              val) >
                                                                      searchResults[index]
                                                                              .money -
                                                                          searchResults[index]
                                                                              .inprosses
                                                                  ? 'we dont need this amount'
                                                                  : null,
                                                              onChanged:
                                                                  (val) => pay =
                                                                      int.parse(
                                                                          val),
                                                            ),
                                                            // shadowColor: Colors.blue,
                                                            color:
                                                                Colors.blue[50],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Card(
                                                        elevation: 10,
                                                        child: new FlatButton(
                                                            child: new Text(
                                                                "Pay now"),
                                                            onPressed: () {
                                                              if (_formkey
                                                                  .currentState
                                                                  .validate())
                                                                setState(() {
                                                                  searchResults[
                                                                          index]
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
                                        child:
                                            Center(child: Text("Donate Now")),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
