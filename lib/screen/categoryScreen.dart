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
  late String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      floatingActionButton: FloatingActionButton(
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
          Expanded(
            child: FirebaseAnimatedList(
                query: widget.dbRef.child(widget.category),
                itemBuilder: (context, snapshot, animation, index) {
                  var ID = snapshot.child('id').value.toString();
                  var Name = snapshot.child('name').value.toString();
                  var Expiry = snapshot.child('expiry').value.toString();
                  var Purchase = snapshot.child('purchase').value.toString();
                  var SerialNo = snapshot.child('serialNo').value.toString();
                  //ItemTile
                  return ItemTile(
                    colorr: widget.colorr,
                    dbRef: widget.dbRef,
                    snapshot: snapshot,
                    id: ID,
                    name: Name,
                    serialNo: SerialNo,
                    expiry: Expiry,
                    purchase: Purchase,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
