
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


class EventListPage extends StatefulWidget {
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {

  final _formkey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                onTap: () =>
                {
                  AwesomeDialog(
                    dialogType: DialogType.INFO,
                    context: context,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'About Events',
                    desc:
                    'here you can see our charites events please help as you can..',
                  )
                    ..show()
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
        body: Container(),),);
  }
}