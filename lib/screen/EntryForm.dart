import 'package:flutter/material.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({super.key});

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final _formKey = GlobalKey<FormState>();
  var NameController = TextEditingController();
  var IDController = TextEditingController();
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
              TextFormField(
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
              SizedBox(
                height: 18,
              ),
              TextFormField(
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
              SizedBox(
                height: 18,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Entered");
                      print("Name : ${NameController.text.toString()}");
                      print("ID : ${IDController.text.toString()}");
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
