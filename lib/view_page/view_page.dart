import 'package:flutter/material.dart';
import 'package:wtasks/view_page/grid_view.dart';
import 'package:wtasks/view_page/list_view.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ViewPage"),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "ListView",
              ),
              Tab(
                text: "GridView",
              ),
            ],
          ),
        ),
        body: Container(
          child: const TabBarView(
            children: <Widget>[
              HomeContentListView(),
              HomeContentGridView(),
            ],
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/view_page/bg1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
