import 'dart:io';

import 'package:flutter/material.dart';

class CameraViewScreen extends StatelessWidget {
  final String imagePath;

  const CameraViewScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.crop_rotate,
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.emoji_emotions_outlined,
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.title,
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              size: 22,
            ),
          ),
        ],
      ),
      body: Container(
        width: ScreenWidth,
        height: ScreenHeight,
        child: Stack(
          children: [
            Container(
              width: ScreenWidth,
              height: ScreenHeight,
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.black38,
                width: ScreenWidth,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add Caption...",
                    prefixIcon: Icon(
                      Icons.add_photo_alternate,
                      color: Colors.white,
                      size: 27,
                    ),
                    suffixIcon: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 20,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
