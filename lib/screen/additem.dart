import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sale_ui_ex/screen/sale.dart';

void main() {
  runApp(MaterialApp(
    home: additem(),
    debugShowCheckedModeBanner: false,
  ));
}

class additem extends StatefulWidget {
  @override
  State<additem> createState() => _additemState();
}

class _additemState extends State<additem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => saleui(),));
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image(
                image: AssetImage("assets/images/setting.png"),
                height: 30,
                width: 30,

              ))
        ],
        title: Text(
          "Add items to sale",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          // hintText: "billing Name",
                          labelStyle: TextStyle(color: Colors.grey),
                          labelText: "Item Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                // hintText: "billing Name",
                                labelStyle: TextStyle(color: Colors.grey),
                                labelText: "Quantity",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        SizedBox(width: 10),
                        // Optional: Add some space between the text fields
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                // hintText: "billing Name",
                                labelStyle: TextStyle(color: Colors.grey),
                                labelText: "Unit",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                // hintText: "billing Name",
                                labelStyle: TextStyle(color: Colors.grey),
                                labelText: "Rate (Price/Unit)",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        SizedBox(width: 10),
                        // Optional: Add some space between the text fields
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                // hintText: "billing Name",
                                labelStyle: TextStyle(color: Colors.grey),
                                labelText: "Without Tax",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => additem(),));
                },
                child: Text("Save & New"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  side: BorderSide(width:0.5, color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            // Optional: Add some space between the text fields
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => additem(),));
                },
                child: Text("Save",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(double.infinity, 55),
                  side: BorderSide(width: 0.5, color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => additem(),));
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Icon(
            //         CupertinoIcons.plus_circle_fill,
            //         color: Colors.blue,
            //       ),
            //       Text(
            //         "Add items",
            //         style: TextStyle(
            //             color: Colors.blue,
            //             fontWeight: FontWeight.w500),
            //       ),
            //       SizedBox(
            //         width: 5,
            //       ),
            //       Text(
            //         "(Optional)",
            //         style: TextStyle(color: Colors.grey),
            //       )
            //     ],
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: Size(double.infinity, 55),
            //     side: BorderSide(width: 1.0, color: Colors.grey),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
