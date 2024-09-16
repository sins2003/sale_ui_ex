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
  TextEditingController itemnamecontroller = TextEditingController();
  TextEditingController unitycontroller = TextEditingController();
  TextEditingController quantitycontroller = TextEditingController();
  TextEditingController ratecontroller = TextEditingController();
  String selectedValuetax = 'Without Tax';
  String selectedValueunt = '1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
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
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: TextField(
                      decoration: InputDecoration(

                          labelStyle: TextStyle(color: Colors.grey),
                          labelText: "Item Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 10, left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(

                                labelStyle: TextStyle(color: Colors.grey),
                                labelText: "Quantity",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        SizedBox(width: 10),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                hint: Text("Unit"),
                                value: selectedValueunt,
                                // Current value
                                icon: Image(
                                  image: AssetImage("assets/images/down.png"),
                                  height: 20,
                                  width: 20,
                                ),
                                // Dropdown icon
                                iconSize: 24,
                                isExpanded: true,
                                // elevation: 16,
                                style: TextStyle(color: Colors.black),
                                underline: SizedBox(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValueunt = newValue!;
                                  });
                                },
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(value),
                                    ), // Display text
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                // hintText: "billing Name",
                                labelStyle: TextStyle(color: Colors.grey),
                                labelText: "Rate (Price/Unit)",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: selectedValuetax,
                                // Current value
                                icon: Image(
                                  image: AssetImage("assets/images/down.png"),
                                  height: 20,
                                  width: 20,
                                ),
                                // Dropdown icon
                                iconSize: 24,
                                isExpanded: true,
                                // elevation: 16,
                                style: TextStyle(color: Colors.black),
                                underline: SizedBox(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValuetax = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Without Tax',
                                  'With Tax',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(value),
                                    ), // Display text
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,)
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
          ],
        ),
      ),
    );
  }
}
