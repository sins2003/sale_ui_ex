import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sale_ui_ex/screen/additem.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: saleui(),
    debugShowCheckedModeBanner: false,
  ));
}

class saleui extends StatefulWidget {
  @override
  State<saleui> createState() => _saleuiState();
}

class _saleuiState extends State<saleui> {
  TextEditingController datecontroller = TextEditingController();
  TextEditingController customercontroller = TextEditingController();
  TextEditingController billingrcontroller = TextEditingController();
  TextEditingController phonercontroller = TextEditingController();
  String selectedValue = ' ';
  bool firstswitchvalue = false;
  Color switchcolor = Color(0xff06bc7d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          "Sale",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 30,
              child: AnimatedToggleSwitch<bool>.size(
                current: firstswitchvalue,
                values: [false, true],
                iconOpacity: 0.2,
                indicatorSize: Size.fromWidth(50),
                customIconBuilder: (context, local, global) => Text(
                  local.value ? 'Credit' : 'Cash',
                  style: TextStyle(color: Colors.black),
                ),
                borderWidth: 5,
                iconAnimationType: AnimationType.onHover,
                style: ToggleStyle(
                    indicatorColor: switchcolor,
                    backgroundColor: Colors.pink[50],
                    borderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(30)),
                selectedIconScale: 1,
                onChanged: (value) => setState(() => firstswitchvalue = value),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {},
              icon: Image(
                image: AssetImage("assets/images/setting.png"),
                height: 30,
                width: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              child: Column(
                                children: [
                                  Text(
                                    "Invoice No.",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    "23-24-01 ",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 200),
                              child: Text(
                                "Date",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  datecontroller.text,
                                  style: TextStyle(color: Colors.black),
                                ),
                                IconButton(
                                    onPressed: () {
                                      _selectDate();
                                    },
                                    icon: Image(
                                      image:
                                          AssetImage("assets/images/down.png"),
                                      height: 20,
                                      width: 20,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Firm Name:",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "xianinfotech LLP",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: DropdownButton<String>(
                      value: selectedValue,
                      // Current value
                      icon: Image(
                        image: AssetImage("assets/images/down.png"),
                        height: 20,
                        width: 20,
                      ),
                      // Dropdown icon
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: <String>[
                        ' ',
                        'xianinfotech LLP 2',
                        'xianinfotech LLP 3',
                        'xianinfotech LLP 4'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value), // Display text
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              // hintText: "Customer",
                              labelText: "Customer *",
                              labelStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              // hintText: "billing Name",
                              labelStyle: TextStyle(color: Colors.grey),
                              labelText: "Billing Name (optional)",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              // hintText: "Phone Number",
                              labelStyle: TextStyle(color: Colors.grey),
                              labelText: "Phone Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => additem(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.plus_circle_fill,
                                color: Colors.blue,
                              ),
                              Text(
                                "Add items",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "(Optional)",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 55),
                            side: BorderSide(width: 1.0, color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text(
                  "Save & New",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 55),
                  side: BorderSide(width: 0.5, color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 55),
                  side: BorderSide(width: 0.5, color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: IconButton(
                  onPressed: () {},
                  icon: Image(
                    image: AssetImage("assets/images/share.png"),
                    height: 30,
                    width: 30,
                    color: Colors.blue,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (_picked != null) {
      setState(() {
        datecontroller.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
