import 'package:cloud_firestore/cloud_firestore.dart';


class firebasehelepr {
  var collection = FirebaseFirestore.instance.collection("xianinfotech LLP");
  Future<void> addData(String date,String customer,String billingname,String phoneno,String itemname,String quantity,String rate) async {
    collection.add({
      "date":date,
      "customer":customer,
      "billingname":billingname,
      "phoneno":phoneno,
      "itemname":itemname,
      "quantity":quantity,
      "rate":rate
    }).then((value) {
      print("user add successfully");
    }).catchError((error) {
      print("failed to add user $error");
    });
  }
}
