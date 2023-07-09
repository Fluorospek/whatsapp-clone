import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/screens/idiv_page.dart';
import '../model/chatmodel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatmodel}) : super(key: key);
  final Chatmodel chatmodel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndivPage(
              chatmodel: chatmodel,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                chatmodel.isGroup! ? "assets/groups.svg" : "assets/person.svg",
                color: Colors.white,
                height: 38,
                width: 37,
              ),
            ),
            trailing: Text(chatmodel.time!),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 6,
                ),
                Text(
                  chatmodel.currentMsg!,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            title: Text(
              chatmodel.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
