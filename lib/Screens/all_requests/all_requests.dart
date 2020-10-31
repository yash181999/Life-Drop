import 'package:flutter/material.dart';
import 'package:versionbeta3/Screens/all_requests/received_requests.dart';
import 'package:versionbeta3/color/color.dart';

import 'my_requests.dart';

class AllRequests extends StatefulWidget {
  @override
  _AllRequestsState createState() => _AllRequestsState();
}

class _AllRequestsState extends State<AllRequests> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: Text("Requests",style: TextStyle(color: black, fontSize: 22),),

          bottom: TabBar(
            labelColor: black,
            tabs: [
              Tab(
                text: "My Requests",

              ),
              Tab(
                text: "Received Requests",
              )
            ],
          ),
        ),

        body: TabBarView(
          children: [
            MyRequests(),
            ReceivedRequests(),
          ],
        ),
      ),
    );
  }
}

