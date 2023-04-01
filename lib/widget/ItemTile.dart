import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatefulWidget {
  final Color colorr;
  DatabaseReference dbRef;
  DataSnapshot snapshot;
  String id;
  String name, serialNo, purchase, expiry;
  ItemTile(
      {required this.colorr,
      required this.dbRef,
      required this.snapshot,
      required this.id,
      required this.name,
      required this.serialNo,
      required this.expiry,
      required this.purchase});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            leading: Text(
              '${widget.name}',
              style: TextStyle(fontSize: 18),
            ),
            title: Column(
              children: [
                Text('Purchased on ${widget.purchase}'),
                Text('Expiring  on  ${widget.expiry}'),
              ],
            ),
            tileColor: widget.colorr,
          ),
        ),
      ),
    );
  }
}
