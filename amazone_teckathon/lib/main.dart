

import 'package:amazone_teckathon/pages/Account.dart';
import 'package:amazone_teckathon/pages/EventList.dart';
import 'package:amazone_teckathon/pages/Home.dart';
import 'package:amazone_teckathon/pages/Welcome.dart';
import 'package:amazone_teckathon/pages/category_list_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(splash());
}

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: new Scaffold(
            body: Stack(

              children: <Widget>[
                Center(

                    child: new SplashScreen(

                      seconds: 5,
                      navigateAfterSeconds: Welcome(),
                      image: Image.asset("images/wecare.jpeg",                   ),
                      backgroundColor:Color.fromRGBO(242, 247, 251,1),//rgb(242, 247, 251)
                      photoSize: 180,
                      loadingText: Text(
                          'WECARE ',
                          style: TextStyle(fontSize: 30,color:Color.fromRGBO(24, 110, 186,1),    )                  //Colors.blue[300]),

                      ),

                      loaderColor:Color.fromRGBO(242, 247, 251,1),)// Color.fromRGBO(24, 110, 186,1),),
                ),
              ],
            ),
          ),
        ));
  }
}

class Golden extends StatefulWidget {
  @override
  _GoldenState createState() => _GoldenState();

  static void setLocale(BuildContext context, Locale locale) {
    _GoldenState state = context.findAncestorStateOfType<_GoldenState>();
  }
}

class _GoldenState extends State<Golden> {



  int _selectedTabIndex = 0;

  List _pages = [Home(), EventListPage(),  CategoryListPage(), Account()];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      color: Colors.blue[100],
      title: "WECARE ",



      debugShowCheckedModeBanner: false,
      home:WillPopScope(
        onWillPop: ()=>_onBackPressed(),
        child:


        SafeArea(
          child: Scaffold(
            body: _pages[_selectedTabIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedTabIndex,
              onTap: _changeIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.event),
                    title: Text("events" )),

                BottomNavigationBarItem(
                    icon: Icon(Icons.local_pharmacy),
                    title: Text( "Charities")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle),
                    title: Text( "My Account" )),
              ],
            ),
          ),
        ),),
    );
  }

  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            //    offset: Offset(1.0, 6.0),
            // blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }


  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: roundedButton("No",  Colors.black,
                const Color(0xFFFFFFFF)),
          ),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: roundedButton(" Yes ",  Colors.black,
                const Color(0xFFFFFFFF)),
          ),
        ],
      ),
    ) ??
        false;
  }



}




