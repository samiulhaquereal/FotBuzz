import 'package:flutter/material.dart';
import 'package:fotbuzz/db/api_manager.dart';
import 'package:fotbuzz/view/pagebody.dart';

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161616),
      appBar: AppBar(
        backgroundColor: Color(0xFF161616),
        elevation: 0.0,
        title: Text(
          "FOTBUZZ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      //now we have finished the api service let's call it
      //Now befo re we create Our layout let's create our API service
      body: FutureBuilder(
        future: SoccerApi()
            .getAllMatches(), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            print((snapshot.data)?.length);
            return PageBody(snapshot.data ?? []);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }, // here we will buil the app layout
      ),
    );
  }
}