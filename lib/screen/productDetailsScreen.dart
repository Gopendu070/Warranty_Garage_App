import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:warranty_garage/screen/imageViewScreen.dart';

class productDetailsScreen extends StatefulWidget {
  String name;
  String serialNo;
  String purchase;
  String expiry;
  String remMin;
  Color colorr;
  DataSnapshot imgURL;
  String category;
  productDetailsScreen(
      {required this.colorr,
      required this.name,
      required this.serialNo,
      required this.expiry,
      required this.purchase,
      required this.imgURL,
      required this.remMin,
      required this.category});

  @override
  State<productDetailsScreen> createState() => _productDetailsScreenState();
}

class _productDetailsScreenState extends State<productDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 180, 186, 198),
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Color.fromARGB(255, 30, 42, 49),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.imgURL.child('2').value.toString() != 'null'
              ? Container(
                  margin: EdgeInsets.only(left: 9, right: 9),
                  height: 300,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: widget.imgURL.child('1').value.toString() != 'null'
                      ? RawScrollbar(
                          thumbVisibility: false,
                          thumbColor: Colors.grey,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 300,
                                  width: 150,
                                  child: InkWell(
                                    child: Image.network(
                                      widget.imgURL
                                          .child('${index + 1}')
                                          .value
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                    onTap: () {
                                      print(widget.imgURL.children.length);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => imageViewScreen(
                                            imgUrl: widget.imgURL
                                                .child('${index + 1}')
                                                .value
                                                .toString(),
                                            name: widget.name,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }),
                            itemCount: widget.imgURL.children.length - 1,
                          ),
                        )
                      : Center(
                          child: Text('Sorry, No Invoice Uploaded !'),
                        ),
                )
              : Container(
                  margin: EdgeInsets.only(left: 9, right: 9),
                  height: 300,
                  width: 200,
                  alignment: Alignment.center,
                  child: widget.imgURL.child('1').value.toString() != 'null'
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 300,
                                width: 150,
                                child: InkWell(
                                  child: Image.network(
                                    widget.imgURL
                                        .child('${index + 1}')
                                        .value
                                        .toString(),
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () {
                                    print(widget.imgURL.children.length);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => imageViewScreen(
                                          imgUrl: widget.imgURL
                                              .child('${index + 1}')
                                              .value
                                              .toString(),
                                          name: widget.name,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                          itemCount: widget.imgURL.children.length - 1,
                        )
                      : Center(
                          child: Text('Sorry, No Invoice Uploaded !'),
                        ),
                ),
          SizedBox(height: 10),
          Divider(thickness: 2),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      'Category  :  ${widget.category}',
                      style: TextStyle(fontSize: 16.5, color: Colors.grey[600]),
                    ),
                  ]),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Name  :  ${widget.name}',
                        style:
                            TextStyle(fontSize: 16.5, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Serial No  :  ${widget.serialNo}',
                        style:
                            TextStyle(fontSize: 16.5, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Purchase Date  :  ${widget.purchase}',
                        style:
                            TextStyle(fontSize: 16.5, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Expiry Date  :  ${widget.expiry}',
                        style:
                            TextStyle(fontSize: 16.5, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ],
          )
        ],
      )),
    );
  }
}
