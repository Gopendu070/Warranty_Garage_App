import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:warranty_garage/screen/editingScreen.dart';
import 'package:warranty_garage/screen/productDetailsScreen.dart';

class ItemTile extends StatefulWidget {
  final Color colorr;
  DatabaseReference dbRef;
  DataSnapshot snapshot;
  String id;
  String category;
  String imgURL;
  String remMin;
  String name, serialNo, purchase, expiry;
  ItemTile({
    required this.colorr,
    required this.dbRef,
    required this.category,
    required this.snapshot,
    required this.id,
    required this.name,
    required this.serialNo,
    required this.expiry,
    required this.purchase,
    required this.imgURL,
    required this.remMin,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  var nameController = TextEditingController();
  var serialNoController = TextEditingController();
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
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            title: Column(
              children: [
                Text(
                  'Purchased on ${widget.purchase}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Expiring  on  ${widget.expiry}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            onLongPress: () {
              menuItems();
            },
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => productDetailsScreen(
                            colorr: widget.colorr,
                            name: widget.name,
                            category: widget.category,
                            serialNo: widget.serialNo,
                            expiry: widget.expiry,
                            purchase: widget.purchase,
                            imgURL: widget.imgURL,
                            remMin: widget.remMin,
                          )));
            },
            tileColor: Color.fromARGB(255, 30, 42, 49),
          ),
        ),
      ),
    );
  }

  Future<void> menuItems() {
    nameController.text = widget.name;
    serialNoController.text = widget.serialNo;
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
              backgroundColor: Colors.grey[300],
              title: Text("Update"),
              content: Builder(builder: (context) {
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;
                return Container(
                  height: height - 550,
                  width: width - width / 2,
                  child: Column(children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => editingScreen(
                                  expiryD: widget.expiry,
                                  purchaseD: widget.purchase,
                                  nameController: nameController,
                                  serialNoController: serialNoController,
                                  id: widget.id,
                                  dbRef: widget.dbRef,
                                  category: widget.category),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('Edit  '), Icon(Icons.edit)],
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.dbRef
                            .child(widget.category)
                            .child(widget.id)
                            .remove();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('Delete   '), Icon(Icons.delete)],
                      ),
                    ),
                  ]),
                );
              }));
        }));
  }
}
