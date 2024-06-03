import 'package:flutter/material.dart';
import 'package:whatsapp_clone/customUI/Status%20Page/other_story.dart';
import 'package:whatsapp_clone/customUI/Status%20Page/own_story.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: FloatingActionButton(
              elevation: 2,
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          Container(
            child: FloatingActionButton(
              elevation: 2,
              onPressed: () {},
              child: Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 7),
            OwnStatus(),
            StatusDivider("Recent Updates"),
            OtherStatus(
              name: "Random Guy",
              time: "10:13",
              isSeen: false,
              statusNum: 4,
            ),
            StatusDivider("Viewed Updates"),
            OtherStatus(
              name: "Random Guy 2",
              time: "12:21",
              isSeen: true,
              statusNum: 2,
            )
          ],
        ),
      ),
    );
  }

  Widget StatusDivider(String text) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          text,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
