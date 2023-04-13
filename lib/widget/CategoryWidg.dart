import 'package:flutter/material.dart';

class CategoryWidg extends StatelessWidget {
  var name = "";
  final Color colorr;
  LinearGradient gradientColor;
  CategoryWidg(
      {required this.name, required this.colorr, required this.gradientColor});
//This widhet will contain different categories
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 6),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 160,
          width: 150,
          child: Center(
              child: name != 'Others'
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 14),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('lib/image/${name}.png'),
                                  fit: BoxFit.contain)),
                        ),
                        SizedBox(height: 0),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  : Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    )),
          decoration: BoxDecoration(
            gradient: gradientColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(offset: Offset(2, 1), color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
