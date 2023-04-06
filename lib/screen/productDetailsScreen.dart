import 'package:flutter/material.dart';

class productDetailsScreen extends StatefulWidget {
  String name;
  String serialNo;
  String purchase;
  String expiry;
  String remMin;
  Color colorr;
  String imgURL;
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
          Container(
            height: 300,
            width: 300,
            child: widget.imgURL != 'null'
                ? Image.network(widget.imgURL)
                : Center(
                    child: Text('Sorry, No Invoice Uploaded !'),
                  ),
          ),
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
                            TextStyle(fontSize: 16.5, color: Colors.grey[600]),
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
                            TextStyle(fontSize: 16.5, color: Colors.grey[600]),
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
