import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './Detail.dart';
import './adddata.dart';
import './main.dart';

class Kasir extends StatefulWidget {
  @override
  _KasirState createState() => _KasirState();
}

class _KasirState extends State<Kasir> {
  getData() async {
    // make delay
    // await Future.delayed(Duration(seconds: 4));

    var response = await http.get(Uri.parse(baseUrl+"/uasmobileklinik/reservasi/index"));
    var data = json.decode(response.body)['data'];
    // print(data);
    return data;
  }
  reservasikan(id) async {
    var response = await http.get(Uri.parse(baseUrl+"/uasmobileklinik/reservasi/res/"+id));
    var data = json.decode(response.body)['data'];
    // print(data);
    return data;
  }
  void confirm() {
  AlertDialog alertDialog = AlertDialog(
    content: Text("Are You sure want change status?"),
    actions: <Widget>[
      ElevatedButton(
        child: Text("OK DELETE!",style: TextStyle(color: Colors.black),),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
        ),
        onPressed: (){},
      ),
      ElevatedButton(
        child: Text("CANCEL",style: TextStyle(color: Colors.black)),
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
        onPressed: ()=> Navigator.pop(context),
      ),
    ],
  );

  showDialog(context: context, builder: (BuildContext context)=>alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kasir Rumah Sakit"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            getData();
          });
        },
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          // print(snapshot.hashCode);
          // if (snapshot.hashCode != 200) print(snapshot.error);

          // print(data[0]);
          if (snapshot.hasData) {
            List data = snapshot.data! as List;
            return ItemList(list: data);
          } else {
            return Center(child: Center(child: Column(children: [Text("Loading..."), CircularProgressIndicator()]),));
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: ()=>Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (BuildContext context)=> AddData(),
      //     )
      //   ),
      // ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List? list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context)=> Detail(list: list! , index: i,)
              )
            ),
            child: Card(
              child: ListTile(
                title: Text(list![i]['nama']),
                leading: Icon(Icons.circle_sharp, color: ("${list![i]['status']}" == '1') ? Colors.red : Colors.green,),
                subtitle: Text("Time : ${list![i]['created_at']}"),
                trailing: ElevatedButton(
                  // run reservasikan(${list![i]['id_reservasi']}) function with onpress
                  onPressed: , 
                  child: Icon(Icons.insert_link_rounded),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: Colors.blue
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// class ItemList extends StatelessWidget {
//   ItemList({this.list});
//   final List? list;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: list == null ? 0 : list.length,
//       itemBuilder: (context, i) {
//         return Container(
//           padding: const EdgeInsets.all(10.0),
//           child: GestureDetector(
//             onTap: (){},
//             // onTap: ()=>Navigator.of(context).push(
//             //   MaterialPageRoute(
//             //     builder: (BuildContext context)=> Detail(list:list , index: i,)
//             //   )
//             // ),
//             child: Card(

//               child: ListTile(
//                 title: Text(list[i]['item_name']),
//                 leading: Icon(Icons.widgets),
//                 subtitle: Text("Stock : ${list[i]['stock']}"),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
