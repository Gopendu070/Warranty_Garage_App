import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:warranty_garage/screen/EntryForm.dart';
import 'package:warranty_garage/widget/ItemTile.dart';

class CategoryScreen extends StatefulWidget {
  Color colorr;
  String category;
  DatabaseReference dbRef;
  //  DatabaseReference databaseRef;

  CategoryScreen(
      {required this.category, required this.dbRef, required this.colorr});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late DataSnapshot snap;
  late String id;
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool showSearchBar = false;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 183, 182, 182),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 42, 49),
        title: Text(widget.category),
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 30, 42, 49),
        child: Icon(Icons.add),
        onPressed: () {
          /***Setting the product id***/
          id = DateTime.now().microsecondsSinceEpoch.toString();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EntryForm(
                      id: id,
                      dbRef: widget.dbRef,
                      category: widget.category,
                    )),
          );
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              cursorHeight: 20,
              cursorColor: Color.fromARGB(255, 30, 42, 49),
              onChanged: (String value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: "Search here",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 30, 42, 49), width: 2),
                      borderRadius: BorderRadius.circular(29)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 30, 42, 49), width: 2),
                      borderRadius: BorderRadius.circular(29))),
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: widget.dbRef.child(widget.category),
                itemBuilder: (context, snapshot, animation, index) {
                  snap = snapshot;
                  var ID = snapshot.child('id').value.toString();
                  var Name = snapshot.child('name').value.toString();
                  var Expiry = snapshot.child('expiry').value.toString();
                  var Purchase = snapshot.child('purchase').value.toString();
                  var SerialNo = snapshot.child('serialNo').value.toString();
                  var remMin = snapshot.child('remMin').value.toString();
                  var imgURL = snapshot.child('imgUrl').value.toString();
                  if (searchController.text.isEmpty) {
                    return (Name != 'null')
                        ? ItemTile(
                            //ItemTile
                            category: widget.category,
                            colorr: widget.colorr,
                            dbRef: widget.dbRef,
                            snapshot: snapshot,
                            id: ID,
                            name: Name,
                            serialNo: SerialNo,
                            expiry: Expiry,
                            purchase: Purchase,
                            imgURL: imgURL,
                            remMin: remMin,
                          )
                        : Container();
                  } else if (Name.toLowerCase().contains(
                      searchController.text.toLowerCase().toString())) {
                    return Name != 'null'
                        ? ItemTile(
                            //ItemTile
                            category: widget.category,
                            colorr: widget.colorr,
                            dbRef: widget.dbRef,
                            snapshot: snapshot,
                            id: ID,
                            name: Name,
                            serialNo: SerialNo,
                            expiry: Expiry,
                            purchase: Purchase,
                            imgURL: imgURL,
                            remMin: remMin,
                          )
                        : Container();
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
