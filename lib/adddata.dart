import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {


TextEditingController controllerCode = TextEditingController();
TextEditingController controllerName = TextEditingController();
TextEditingController controllerPrice = TextEditingController();
TextEditingController controllerStock = TextEditingController();

void addData(){
  var url="http://10.0.2.2/my_store/adddata.php";

  var data = {
    "itemcode": controllerCode.text,
    "itemname": controllerName.text,
    "price": controllerPrice.text,
    "stock": controllerStock.text
  };
  print(data);
  http.post(Uri.parse(url), body: data);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Reservasi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerCode,
                  decoration: InputDecoration(
                      hintText: "Item Code", labelText: "Item Code"),
                ),
                TextField(
                  controller: controllerName,
                  decoration: InputDecoration(
                      hintText: "Item Name", labelText: "Item Name"),
                ),
                TextField(
                  controller: controllerPrice,
                  decoration: InputDecoration(
                      hintText: "Price", labelText: "Price"),
                ),
                TextField(
                  controller: controllerStock,
                  decoration: InputDecoration(
                      hintText: "Stock", labelText: "Stock"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                  onPressed: (){
                    addData();
                    Navigator.pop(context);
                  }, 
                  child: Text("Tambah Data", style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Colors.blueAccent,
                  ),
                ),
                // RaisedButton(
                //   child: Text("ADD DATA"),
                //   color: Colors.blueAccent,
                //   onPressed: () {
                //     addData();
                //     Navigator.pop(context);
                //   },
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
