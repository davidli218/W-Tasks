import 'package:flutter/material.dart';
import 'package:wtasks/Widget/app_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProjectAppBar(title: "Dashboard"),
      body: Center(
        child: Text("Empty"),
      ),
    );
  }
}
