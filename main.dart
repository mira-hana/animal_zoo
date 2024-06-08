//insert this code to animal_zoo > lib > main.dart

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  File? _image;
  List<dynamic>? _output;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    loadModel().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal in the Zoo!"),
      ),
      body: _isLoading
          ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null ? Container() : Image.file(_image!),
            SizedBox(height: 16),
            _output == null
                ? Text("")
                : _output!.isEmpty
                ? Text("Oh no! What is that?")
                : Text(
              "${_output![0]["label"]}",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPicker(context),
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                onTap: () {
                  _chooseImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _chooseImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _chooseImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    setState(() {
      _isLoading = true;
      _image = File(image.path);
    });
    runModelOnImage(_image!);
  }

  runModelOnImage(File image) async {
    try {
      var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 28,
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.5,
      );
      setState(() {
        _isLoading = false;
        _output = output;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Display an error message using a Snackbar or Dialog
      print("Error running model: $e");
    }
  }

  loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
      );
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
