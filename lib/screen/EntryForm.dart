import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warranty_garage/widget/imagePickerDialog.dart';

class EntryForm extends StatefulWidget {
  DatabaseReference dbRef;
  String category;
  String id;
  EntryForm({
    required this.id,
    required this.dbRef,
    required this.category,
  });

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final _formKey = GlobalKey<FormState>();
  var NameController = TextEditingController();
  var IDController = TextEditingController();
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
          'Enter The Details Here',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Product Name
              Flexible(
                child: TextFormField(
                  controller: NameController,
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
                  controller: IDController,
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
                      "Select Purchase Date",
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
                      "Select Expiry Date    ",
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
                          expiryDate_string =
                              DateFormat('yMd').format(expiryDate);
                          remaining =
                              expiryDate.difference(DateTime.now()).inMinutes;

                          widget.dbRef
                              .child(widget.category)
                              .child(widget.id)
                              .set({
                            'expiry': expiryDate_string,
                            'remMin': remaining,
                          });
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

              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (expiryDate_string == '#') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red[300],
                            content: Text("Enter Expiry Date"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        widget.dbRef
                            .child(widget.category)
                            .child(widget.id)
                            .update({
                          'id': widget.id,
                          'name': NameController.text.toString(),
                          'serialNo': IDController.text.toString(),
                          'purchase': purchaseDate_string,
                        });
                        //Navigate to categoryScreen
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Text('Submit'))
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
}
