import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './Detail.dart';
import './adddata.dart';


class Dokter extends StatefulWidget {
  @override
  _DokterState createState() => _DokterState();
}

class _DokterState extends State<Dokter> {
  getData() async {
    // make delay
    // await Future.delayed(Duration(seconds: 4));

    var response = await http.get(Uri.parse("http://172.17.1.90/uasmobileklinik/reservasi/index"));
    var data = json.decode(response.body)['data'];
    // print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kasir Rumah Sakit"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          // print(data[0]);
          if (snapshot.hasData) {
            List data = snapshot.data! as List;
            return ItemList(list: data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context)=> AddData(),
          )
        ),
      ),
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
                leading: Icon(Icons.wysiwyg_rounded),
                subtitle: Text("Time : ${list![i]['created_at']}"),
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
