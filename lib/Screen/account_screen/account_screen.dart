import 'package:flutter/material.dart';
import 'package:wtasks/Widget/app_bar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProjectAppBar(title: "Account"),
      body: Center(
        child: Text("Empty"),
      ),
    );
  }
}
