import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagePickerDialog extends StatefulWidget {
  DatabaseReference dbRef;
  String category;
  String id;
  imagePickerDialog({
    required this.dbRef,
    required this.category,
    required this.id,
  });

  @override
  State<imagePickerDialog> createState() => _imagePickerDialogState();
}

class _imagePickerDialogState extends State<imagePickerDialog> {
  File? _image;
  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future getImageGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 75);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("Nothing picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Upload your bills here"),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
            height: height - 500,
            width: width - 100,
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    child: _image != null
                        ? Image.file(_image!.absolute)
                        : Center(child: Text('Pick from Gallery')),
                    height: 200,
                    width: 200,
                  ),
                  onTap: () {
                    getImageGallery();
                  },
                ),
                OutlinedButton(
                  onPressed: () async {
                    firebase_storage.Reference ref = firebase_storage
                        .FirebaseStorage.instance
                        .ref('/${widget.category}/' + 'img_${widget.id}');

                    firebase_storage.UploadTask uploadTask =
                        ref.putFile(_image!.absolute);

                    await Future.value((uploadTask));
                    var newUrl = await ref.getDownloadURL();

                    //setting the img url key in the realtime db
                    widget.dbRef
                        .child(widget.category)
                        .child(widget.id)
                        .update({
                      'imgUrl': newUrl.toString(),
                    });
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green[300],
                        content: Text("Uploading.."),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
                  child: Text('Upload'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
