import 'package:flutter/material.dart';
import 'package:final_tugas9/user_model.dart';

void main() {
  runApp(MainGet());
}

class MainGet extends StatefulWidget {
  @override
  _MainGetState createState() => _MainGetState();
}

class _MainGetState extends State<MainGet> {
  User user = null;
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
              Text(
                (user != null)
                  ? "id: " +
                      user.id +
                      " | " +
                      "name: " +
                      user.name +
                      " | " +
                      "job: " +
                      user.job +
                      " | " +
                      "createdAt: " +
                      user.created +
                      " | "
                  : "Tidak ada data", style: 
                  TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: "Cardo",
                  ),),
              RaisedButton(
                color: Colors.blue[200],
                splashColor: Colors.green[300],
                 textColor: Colors.white,
                onPressed: () {
                  User.connectToAPI("5ec01a9b1abdc10017b6b280").then((value) {
                    user = value;
                    setState(() {});
                  });
                },
                child: Text("Get"),
              ),
              RaisedButton(
                color: Colors.blue[200],
                splashColor: Colors.green[300],
                 textColor: Colors.white,
                  child: Text("Back to first page"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
