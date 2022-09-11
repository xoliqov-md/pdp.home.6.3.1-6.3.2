import 'package:flutter/material.dart';
import 'package:untitled/data/base.dart';

import '../models/user_model.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

String name = 'salom';

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    getUser();
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'log',
          child: Text(name),
        ),
      ),
    );
  }

  void getUser() {
    Pref.loadUser().then((value) {
      setState(() {
        name = 'Name: ${value.name}\nEmail: ${value.email}\nPassword: ${value.password}';
      });
    });
  }
}
