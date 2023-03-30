import 'package:flutter/material.dart';
import 'package:warranty_garage/screen/EntryForm.dart';

class CategoryScreen extends StatefulWidget {
  String Title;
  //  DatabaseReference databaseRef;

  CategoryScreen({
    required this.Title,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EntryForm()),
          );
        },
      ),
      body: Column(
        children: [
          // Expanded(
          // child: FirebaseAnimatedList(
          //     query: widget.databaseRef,
          //     itemBuilder: (context, snapshot, animation, index) {
          //       return ItemTileWidget(
          //           databaseRef: widget.databaseRef,
          //           snapshot: snapshot,
          //           id: snapshot.child('id').value.toString(),
          //           childName: 'name',
          //           childRoll: 'roll',
          //           childDob: 'dob');
          //     }),
          //),
        ],
      ),
    );
  }
}
