import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'ItemTile.dart';

class animatedLIST extends StatefulWidget {
  DatabaseReference dbRef;
  String category;
  Color colorr;
  animatedLIST(
      {required this.category, required this.dbRef, required this.colorr});

  @override
  State<animatedLIST> createState() => _animatedLISState();
}

class _animatedLISState extends State<animatedLIST> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                var remMin = snapshot.child('remMin').value.toString();
                var imgURL = snapshot.child('imgUrl').value.toString();
                //ItemTile
                return Name != 'null'
                    ? ItemTile(
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
              }),
        ),
      ],
    );
  }
}
