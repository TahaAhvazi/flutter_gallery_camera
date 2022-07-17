import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? myImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work with camera !'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (myImage != null)
                Container(
                  height: 500.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    image: DecorationImage(image: FileImage(myImage!)),
                  ),
                )
              else
                Container(
                  height: 500.0,
                  width: 350.0,
                  color: Colors.greenAccent,
                  child: const Center(
                    child: Text("IMAGE WILL APEAR HERE"),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        ReciveMyImage(mySource: ImageSource.camera),
                    child: const Text("Camera"),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        ReciveMyImage(mySource: ImageSource.gallery),
                    child: const Text("Gallery"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void ReciveMyImage({required ImageSource mySource}) async {
    final myFile = await ImagePicker().pickImage(source: mySource);
    if (myFile?.path != null) {
      setState(() {
        myImage = File(myFile!.path);
      });
    }
  }
}
