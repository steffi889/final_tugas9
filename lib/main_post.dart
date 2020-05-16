import 'package:flutter/material.dart';
import 'package:final_tugas9/post_result_model.dart';
import 'package:final_tugas9/main_get.dart';
void main() {
  runApp(MainPost());
}

class MainPost extends StatefulWidget {
  @override
  _MainPostState createState() => _MainPostState();
}

class _MainPostState extends State<MainPost> {
  PostResult postResult = null;
  final name = TextEditingController();
  final job = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
              title: Text("Stefanny's Page"),
              backgroundColor: Colors.green[200],
              leading: Icon(Icons.person),
              actions: <Widget>[Icon(Icons.assignment)]),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new TextField(
                controller: name,
              ),
              new TextField(controller: job),
              RaisedButton(
                 color: Colors.blue[200],
                splashColor: Colors.green[300],
                 textColor: Colors.white,
                onPressed: () {
                  PostResult.connectToAPI(name.text, job.text).then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: Text("Post"),
              ),
              RaisedButton(
                  color: Colors.blue[200],
                splashColor: Colors.green[300],
                 textColor: Colors.white,
                child: Text ("Get"),
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return MainGet();
                  }
                )
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
