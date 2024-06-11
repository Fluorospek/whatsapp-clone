import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/camera_screen.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key, this.sendImage});

  final Function? sendImage;

  @override
  Widget build(BuildContext context) {
    return CameraScreen(
      sendImage: sendImage,
    );
  }
}
