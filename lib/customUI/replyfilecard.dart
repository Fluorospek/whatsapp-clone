import 'package:flutter/material.dart';

class ReplyFileCard extends StatelessWidget {
  const ReplyFileCard({super.key, this.path, this.message, this.time});
  final String? path;
  final String? message;
  final String? time;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: screenWidth * 0.45, // Set your desired width here
        height: 300, // Set your desired height here
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    "http://192.168.0.166:7000/uploads/$path",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              if (message != "") ...[
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    message!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      time!,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                    ),
                  ],
                )
              ] else ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      time!,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                    ),
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
