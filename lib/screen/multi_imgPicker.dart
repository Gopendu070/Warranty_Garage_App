import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class multi_imgPicker extends StatefulWidget {
  DatabaseReference dbRef;
  String category, id;
  multi_imgPicker(
      {required this.category, required this.id, required this.dbRef});

  @override
  State<multi_imgPicker> createState() => _multi_imgPickerState();
}

class _multi_imgPickerState extends State<multi_imgPicker> {
  List<XFile> multiImages = [];
  List<String> imgURLs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 183, 182, 182),
      appBar: AppBar(
        title: Text('Upload your bills'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: InkWell(
              child: multiImages.isEmpty
                  ? Container(
                      height: 200,
                      width: 200,
                      child: Center(
                          child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Text(
                            'Pick from gallery',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800]),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                      )),
                    )
                  : RawScrollbar(
                      thumbColor: Colors.grey,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                            children: multiImages
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Image.file(
                                        File(e.path),
                                        width: 130,
                                        height: 250,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ))
                                .toList()),
                      ),
                    ),
              onTap: () async {
                multiImages = await multiImagePicker();
                if (multiImages.isNotEmpty) {
                  //setting state whenver images are picked
                  setState(() {});
                }
              },
            ),
          ),
          OutlinedButton(
              onPressed: () async {
                if (widget.dbRef
                        .child(widget.category)
                        .child(widget.id)
                        .child('imgUrl')
                        .child('1')
                        .toString() ==
                    'null') {
                  if (multiImages.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Uploading'),
                      duration: Duration(seconds: 6),
                      backgroundColor: Colors.green[400],
                    ));
                    int i = 1;
                    imgURLs = await multiImageUpload(multiImages);
                    for (String url in imgURLs) {
                      widget.dbRef
                          .child(widget.category)
                          .child(widget.id)
                          .child('imgUrl')
                          .update({
                        '$i': url.toString(),
                      });
                      i = i + 1;
                    }
                    Navigator.pop(context);
                  }
                } else {
                  widget.dbRef
                      .child(widget.category)
                      .child(widget.id)
                      .child('imgUrl')
                      .remove();
                  if (multiImages.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Uploading'),
                      duration: Duration(seconds: 6),
                      backgroundColor: Colors.green[400],
                    ));
                    int i = 1;
                    imgURLs = await multiImageUpload(multiImages);
                    for (String url in imgURLs) {
                      widget.dbRef
                          .child(widget.category)
                          .child(widget.id)
                          .child('imgUrl')
                          .update({
                        '$i': url.toString(),
                      });
                      i = i + 1;
                    }
                    Navigator.pop(context);
                  }
                }
              },
              child: Text('Upload All'))
        ],
      ),
    );
  }

  Future<List<XFile>> multiImagePicker() async {
    List<XFile>? _images = await ImagePicker().pickMultiImage();
    if (_images != null && _images.isNotEmpty) {
      return _images;
    }
    return [];
  }

  Future<String> uploadImage(XFile image) async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('/${widget.category}/' +
            'img_${widget.id}' +
            '${DateTime.now().millisecondsSinceEpoch}');
    await ref.putFile(File(image.path));
    return await ref.getDownloadURL();
  }

  //
  Future<List<String>> multiImageUpload(List<XFile> imageList) async {
    List<String> _path = [];
    for (XFile _image in imageList) {
      _path.add(await uploadImage(_image));
    }
    return _path;
  }
}
