import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'ESP APP',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'ESP Client - Team 43'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _controllerServerAddress = TextEditingController();
  var ip = "192.168.4.1";

  Future<http.Response> sendRequest(String pin) {
    return http.get(Uri.parse('http://${ip}/$pin'));
  }


  @override
  Widget build(BuildContext context) {
    _controllerServerAddress.text = ip;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: Colors.blueGrey.shade800,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Text(
              'GPIO 15',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            new Container(
                margin: EdgeInsets.only(top: 20, bottom: 30),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    new ElevatedButton(

                      // style: ButtonStyle(
                      //   foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      // ),
                        onPressed: () {
                          sendRequest("15/on");
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          padding: EdgeInsets.all(26),
                          textStyle: TextStyle(
                            // fontSize: 30,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        child: Text('Turn On',
                            style:
                            new TextStyle(fontSize: 24, color: Colors.white))),
                    new Container(
                        margin: EdgeInsets.only(left: 20),
                        child: ElevatedButton(
                          // style: ButtonStyle(
                          //   foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          // ),
                          onPressed: () {
                            sendRequest("15/off");
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(26),
                              primary: Colors.red,
                              // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                // fontSize: 30,
                                // fontWeight: FontWeight.bold

                              )),
                          child: Text('Turn Off',
                              style:
                              new TextStyle(fontSize: 24, color: Colors.white)),
                        ))
                  ],
                )),

            new Text(
              'GPIO 23',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            new Container(
                margin: EdgeInsets.only(top: 20),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    new ElevatedButton(

                      // style: ButtonStyle(
                      //   foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      // ),
                        onPressed: () {
                          sendRequest("23/on");
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          padding: EdgeInsets.all(26),
                          textStyle: TextStyle(
                            // fontSize: 30,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        child: Text('Turn On',
                            style:
                            new TextStyle(fontSize: 24, color: Colors.white))),
                    new Container(
                        margin: EdgeInsets.only(left: 20),
                        child: ElevatedButton(
                          // style: ButtonStyle(
                          //   foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          // ),
                          onPressed: () {
                            sendRequest("23/off");
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(26),
                              primary: Colors.red,
                              // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                // fontSize: 30,
                                // fontWeight: FontWeight.bold

                              )),
                          child: Text('Turn Off',
                              style:
                              new TextStyle(fontSize: 24, color: Colors.white)),
                        ))
                  ],
                )),
            new Container(
                margin: const EdgeInsets.only(top: 32),
                child: TextField(
                  controller: _controllerServerAddress,
                  onChanged: (text) {
                    ip = text;
                  },
                  style: new TextStyle(fontSize: 20, color: Colors.white),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.blueGrey)),
                      // fillColor: Colors.blueGrey, filled: true,

                      hintText: '192.168.4.1',
                      labelText: "ESP Address",
                      labelStyle: new TextStyle(color: Colors.white)),
                ))
          ],
        ),
      ),
    );
  }
}
