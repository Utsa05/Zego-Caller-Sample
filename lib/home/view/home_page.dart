import 'package:flutter/material.dart';
import 'package:zego_caller_simple/home/db/user_data_source.dart';
import 'package:zego_caller_simple/home/model/user.dart';
import 'package:zego_caller_simple/home/widgets/user_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> _users = [];

  getUsers() {
    _users = UserDataSource.getUsers();
    setState(() {});
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          backgroundColor: Colors.black87,
          title: const Text("ZEGO Caller"),
        ),
        body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
            itemCount: _users.length,
            itemBuilder: ((context, index) {
              UserModel user = _users[index];
              return UserItem(user: user);
            })));
  }
}
