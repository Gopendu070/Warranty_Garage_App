import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warranty_garage/widget/imagePickerDialog.dart';

class editingScreen extends StatefulWidget {
  DatabaseReference dbRef;
  String category;
  String id;
  TextEditingController nameController;
  TextEditingController serialNoController;
  String purchaseD;
  String expiryD;
  editingScreen({
    required this.nameController,
    required this.serialNoController,
    required this.id,
    required this.dbRef,
    required this.category,
    required this.expiryD,
    required this.purchaseD,
  });

  @override
  State<editingScreen> createState() => _editingScreenState();
}

class _editingScreenState extends State<editingScreen> {
  late String Pid;

  final _formKey = GlobalKey<FormState>();

  var purchaseDate = DateTime.now();
  String purchaseDate_string = "Not Entered";
  late DateTime expiryDate;
  String expiryDate_string = "#";
  late int remaining;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category}',
          textAlign: TextAlign.center,
        ),
      ),
      body:
          // Text("Purcased on: ${widget.expiryD}"),
          // Text("Expiring on: ${widget.purchaseD}"),
          Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Product Name
              Flexible(
                child: TextFormField(
                  controller: widget.nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(width: 2)),
                    hintText: 'Product Name',
                  ),
                  validator: (value) {
                    //Validating name field
                    if (value == null || value.isEmpty)
                      return "Please Enter";
                    else
                      return null;
                  },
                ),
              ),
              SizedBox(
                height: 18,
              ),
              //Product ID
              Flexible(
                child: TextFormField(
                  controller: widget.serialNoController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(width: 2),
                    ),
                    hintText: 'Product ID/Serial No.',
                  ),
                  validator: (value) {
                    //Validating field
                    if (value == null || value.isEmpty)
                      return "Please Enter";
                    else
                      return null;
                  },
                ),
              ),
              SizedBox(
                height: 18,
              ),
              //Purchase Date
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Select Purchase Date: ${widget.purchaseD}",
                      style: TextStyle(fontSize: 15.5, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () async {
                          DateTime? pDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1990),
                            lastDate: DateTime.now(),
                          );
                          if (pDate == null) return;
                          purchaseDate = pDate;
                          purchaseDate_string =
                              DateFormat('yMd').format(purchaseDate);

                          setState(() {
                            widget.purchaseD = purchaseDate_string;
                          });
                        },
                        icon: Icon(Icons.calendar_month_rounded))
                  ],
                ),
              ),
              //Expiry Date
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Select Expiry Date:  ${widget.expiryD}",
                      style: TextStyle(fontSize: 15.5, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () async {
                          DateTime? eDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2060),
                          );
                          if (eDate == null) return;
                          expiryDate = eDate;

                          expiryCheckDialog();
                        },
                        icon: Icon(Icons.calendar_month_rounded))
                  ],
                ),
              ),
              //Image Upload
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Upload Invoice/Bills: ',
                      style: TextStyle(fontSize: 15.5, color: Colors.grey[600]),
                    ),
                    IconButton(
                        onPressed: () {
                          imagePickerDialoge(); //showing the dialog box
                        },
                        icon: Icon(Icons.upload_rounded))
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Cancel Button
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                  SizedBox(
                    width: 15,
                  ),
                  //Submit Button
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          widget.dbRef
                              .child(widget.category)
                              .child(widget.id)
                              .update({
                            'name': widget.nameController.text.toString(),
                            'serialNo':
                                widget.serialNoController.text.toString(),
                            'expiry': expiryDate_string != '#'
                                ? expiryDate_string
                                : widget.expiryD,
                            'purchase': purchaseDate_string != 'Not Entered'
                                ? purchaseDate_string
                                : widget.purchaseD,
                          });
                          //Navigate to categoryScreen
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Submit')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> imagePickerDialoge() async {
    return showDialog(
      context: context,
      builder: ((context) {
        return imagePickerDialog(
          dbRef: widget.dbRef,
          category: widget.category,
          id: widget.id,
        );
      }),
    );
  }

  Future<void> expiryCheckDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Builder(builder: (context) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;
              return Container(
                height: height - 400,
                width: width - 100,
                child: Row(
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          expiryDate_string =
                              DateFormat('yMd').format(expiryDate);
                          setState(() {
                            widget.expiryD = expiryDate_string;
                          });
                          remaining =
                              expiryDate.difference(DateTime.now()).inMinutes;
                          widget.dbRef
                              .child(widget.category)
                              .child(widget.id)
                              .update({
                            'expiry': expiryDate_string,
                            'remMin': remaining,
                          });
                          Navigator.pop(context);
                          return;
                        },
                        child: Text('Confirm')),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          return;
                        },
                        child: Text('Cancel')),
                  ],
                ),
              );
            }),
          );
        });
  }
}
