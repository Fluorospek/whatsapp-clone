import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/model/chatmodel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.chatmodel}) : super(key: key);
  final Chatmodel chatmodel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.blueGrey[200],
              child: SvgPicture.asset(
                'assets/person.svg',
                color: Colors.white,
                height: 38,
                width: 37,
              ),
            ),
            chatmodel.selected
                ? const Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 11,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        chatmodel.name,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      subtitle: Text(
        chatmodel.status!,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
