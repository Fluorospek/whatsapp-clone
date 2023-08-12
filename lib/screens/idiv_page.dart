import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsapp_clone/model/chatmodel.dart';
import 'package:whatsapp_clone/screens/camera_screen.dart';

import '../customUI/own_msg_box.dart';
import '../customUI/reply_card.dart';
import '../model/message_model.dart';

class IndivPage extends StatefulWidget {
  const IndivPage({Key? key, required this.chatmodel, required this.source})
      : super(key: key);
  final Chatmodel chatmodel;
  final Chatmodel source;

  @override
  State<IndivPage> createState() => _IndivPageState();
}

class _IndivPageState extends State<IndivPage> {
  final _textController = TextEditingController();
  bool _showEmoji = false;
  late IO.Socket socket;
  bool sendButton = false;
  List<MessageModel> messages = [];
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
  }

  void connect() {
    socket =
        IO.io("https://whatsapp-clone-rmsb.onrender.com/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    print(socket.connected);
    socket.emit("signin", widget.source.id);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (data) {
        print(data);
        setMsg("destination", data["message"]);
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
  }

  void sendMsg(String msg, int sourceID, int targetID) {
    setMsg("source", msg);
    socket.emit(
        "message", {"message": msg, "source": sourceID, "target": targetID});
  }

  void setMsg(String type, String msg) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: msg,
        time: DateTime.now().toString().substring(10, 16));
    setState(() {
      setState(() {
        messages.add(messageModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        if (_showEmoji) {
          setState(() {
            _showEmoji = !_showEmoji;
          });
        }
      },
      child: WillPopScope(
        onWillPop: () {
          if (_showEmoji) {
            setState(() {
              _showEmoji = !_showEmoji;
            });
            return Future.value(false); //does not go back to previous page
          } else
            return Future.value(true); //goes back to previous page
        },
        child: Scaffold(
          backgroundColor: Colors.blueAccent,
          appBar: AppBar(
            leadingWidth: 70,
            //to increase the space for leading widgets
            titleSpacing: 5,
            backgroundColor: Color(0xFF075E54),
            leading: InkWell(
              //creates a splash effect when tapped and to add on tap method
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    child: SvgPicture.asset(
                      widget.chatmodel.isGroup!
                          ? "assets/groups.svg"
                          : "assets/person.svg",
                      //always use widget parameter to access a variable defined in a stateless variable in a stateful state
                      color: Colors.white,
                      height: 38,
                      width: 37,
                    ),
                  ),
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatmodel.name,
                      style: const TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'last seen today at 12:05',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.videocam),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.call),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  print(value);
                },
                itemBuilder: (BuildContext context) {
                  return const [
                    PopupMenuItem(
                      value: "View Contact",
                      child: Text("View Contact"),
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
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == messages.length) {
                        return Container(
                          height: 70,
                        );
                      }
                      if (messages[index].type == "source") {
                        return OwnBox(
                          message: messages[index].message!,
                          time: messages[index].time!,
                        );
                      } else if (messages[index].type == "destination") {
                        return ReplyBox(
                          message: messages[index].message!,
                          time: messages[index].time!,
                        );
                      } else
                        return Container();
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 55,
                            child: Card(
                              margin:
                                  EdgeInsets.only(left: 7, right: 7, bottom: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              child: TextFormField(
                                controller: _textController,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                onChanged: (value) {
                                  if (value.length > 0) {
                                    setState(() {
                                      sendButton = true;
                                    });
                                  } else {
                                    setState(() {
                                      sendButton = false;
                                    });
                                  }
                                },
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  if (_showEmoji == true) _showEmoji = false;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type a Message",
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.emoji_emotions),
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        _showEmoji = !_showEmoji;
                                      });
                                    },
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.30,
                                                margin: EdgeInsets.all(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.02),
                                                child: Card(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        attach_icons(
                                                            Icons
                                                                .insert_drive_file,
                                                            Colors.indigo,
                                                            "Documents"),
                                                        attach_icons(
                                                            Icons.camera_alt,
                                                            Colors.pink,
                                                            "Camera"),
                                                        attach_icons(
                                                            Icons.insert_photo,
                                                            Colors.purple,
                                                            "Gallery"),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        attach_icons(
                                                            Icons.headset,
                                                            Colors.orange,
                                                            "Audio"),
                                                        attach_icons(
                                                            Icons.location_pin,
                                                            Colors.teal,
                                                            "Location"),
                                                        attach_icons(
                                                            Icons.person,
                                                            Colors.blue,
                                                            "Contacts")
                                                      ],
                                                    )
                                                  ],
                                                )),
                                              );
                                            },
                                          );
                                        },
                                        icon: Icon(Icons.attach_file),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      CameraScreen()));
                                        },
                                        icon: Icon(Icons.camera_alt),
                                      ),
                                    ],
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, right: 2),
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF075E54),
                              radius: 25,
                              child: IconButton(
                                onPressed: () {
                                  if (sendButton) {
                                    _scrollController.animateTo(
                                      _scrollController
                                          .position.maxScrollExtent,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                    );
                                    sendMsg(
                                      _textController.text,
                                      widget.source.id!,
                                      widget.chatmodel.id!,
                                    );
                                    _textController.clear();
                                    setState(() {
                                      sendButton = false;
                                    });
                                  }
                                },
                                icon: Icon(
                                  sendButton ? Icons.send : Icons.mic,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_showEmoji)
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: EmojiPicker(
                            textEditingController: _textController,
                            config: Config(
                              bgColor: Colors.white,
                              initCategory: Category.SMILEYS,
                              columns: 8,
                              emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget attach_icons(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {
        if (text == "Camera") {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => CameraScreen()));
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: color,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
