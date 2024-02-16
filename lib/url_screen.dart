import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
int message = 0;

late BuildContext scaffoldContext;

displaySnackBar(BuildContext context, String msg) {
  final snackBar = SnackBar(
    content: Text(msg),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {},
    ),
  );
  Scaffold.of(scaffoldContext).showSnackBar(snackBar);
}

class url_screen extends StatefulWidget {
  const url_screen({Key? key}) : super(key: key);

  @override
  State<url_screen> createState() => _url_screenState();
}

class _url_screenState extends State<url_screen> {

  @override
  void initState() {
    super.initState();
    // getInitLedState(); // Getting initial state of LED, which is by default on
  }

  String _status = '';
  String url = "http://192.168.198.8/";
  var response;
  
  turnOnLed() async {
    try {
      String url2 = "http://192.168.198.8/ledon";
      response = await http.get(Uri.parse(url2), headers: {"Accept": "plain/text"});
      setState(() {
        _status = response.body;
        print(response.body);
      });
    } catch (e) {
      // If NodeMCU is not connected, it will throw error
      print(e);
      displaySnackBar(context, 'Module Not Connected');
    }
  }

  turnOffLed() async {
    try {
      String url3 = "http://192.168.198.8/ledoff";
      response = await http.get(Uri.parse(url3), headers: {"Accept": "plain/text"});
      setState(() {
        _status = response.body;
        print(response.body);
      });
    } catch (e) {
      // If NodeMCU is not connected, it will throw error
      print(e);
      displaySnackBar(context, 'Module Not Connected');
    }
  }
  late BuildContext scaffoldContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Builder(builder: (BuildContext context) {
        scaffoldContext = context;
        return ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: turnOnLed,
                    child: Text('Turn LED On'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue) ,
                    onPressed: turnOffLed,
                    child: Text('Turn LED Off'),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top:20),
                padding:EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(style: BorderStyle.solid,color: Colors.black),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Column(
                    children: <Widget>[TextField(
                      onChanged: (String bool){message = int.parse(bool);},
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic),
                      cursorColor: Colors.black,
                    )],
                  ),
                )
            ),


          ],
        );
      }),
    );
  }
}
