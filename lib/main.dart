import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(UserInfo());
class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  var user;
  List userList;
  Future getUser() async {
    http.Response response = await http.get("https://jsonplaceholder.typicode.com/users");
   user = json.decode(response.body);
   setState(() {
  userList = user; 
   });
  }
  @override
  void initState(){
    super.initState();
    getUser();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("User Inforation"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: userList == null ? 0 :userList.length,
          itemBuilder: (context, i){
            final user = userList[i];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text("${user['name']}"),
              ),
            );
          }
        ),
      ),
    );
  }
}