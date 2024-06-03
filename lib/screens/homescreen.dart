import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/camera_page.dart';
import 'package:whatsapp_clone/pages/chat_page.dart';
import 'package:whatsapp_clone/pages/status_page.dart';

import '../model/chatmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.chats, required this.source})
      : super(key: key);
  final List<Chatmodel> chats;
  final Chatmodel source;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF075E54),
          title: Text("Whatsapp Clone"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return const [
                  PopupMenuItem(
                    value: "new group",
                    child: Text("New Group"),
                  ),
                  PopupMenuItem(
                    value: "new broadcast",
                    child: Text("New Broadcast"),
                  ),
                  PopupMenuItem(
                    value: "whatsapp web",
                    child: Text("Whatsapp Web"),
                  ),
                  PopupMenuItem(
                    value: "starred messages",
                    child: Text("Starred Messages"),
                  ),
                  PopupMenuItem(
                    value: "settings",
                    child: Text("Setting"),
                  ),
                ];
              },
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CameraPage(),
            ChatPage(
              chats: widget.chats,
              source: widget.source,
            ),
            StatusPage(),
            Text("calls")
          ],
        ),
      ),
    );
  }
}
