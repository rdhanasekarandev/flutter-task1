import 'package:flutter/material.dart';
import 'package:trips_list_view/tabs/current_tab.dart';
import 'package:trips_list_view/tabs/past_tab.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Trips",
      home: TripsApp(),
    )
  );
}


class TripsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _apptabview();
  }

  Widget _apptabview(){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "CURRENT",),
              Tab(text: "PAST",)
            ],
          ),
          title: Align(alignment: Alignment.center,child: Text("Trips"),),
          backgroundColor: Colors.black,
        ),
        body: TabBarView(
          children: [
            CurrentTab(),
            PastTab()
          ],
        ),
      ),
    );
  }

}

