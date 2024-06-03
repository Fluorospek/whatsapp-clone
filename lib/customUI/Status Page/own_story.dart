import 'package:flutter/material.dart';

class OwnStatus extends StatefulWidget {
  const OwnStatus({super.key});

  @override
  State<OwnStatus> createState() => _OwnStatusState();
}

class _OwnStatusState extends State<OwnStatus> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 25,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.teal,
              child: Icon(
                Icons.add,
                size: 19,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      title: Text(
        "My Status",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        "Tap to add status update",
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
