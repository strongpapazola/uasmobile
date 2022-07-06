import 'package:flutter/material.dart';
// import './editdata.dart';
import 'package:http/http.dart' as http;
import 'package:uasmobile/main.dart';
import 'kasir.dart';

class Detail extends StatefulWidget {
  List? list;
  int? index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url=baseUrl+"/uasmobileklinik/reservasi/delete/"+widget.list![widget.index!]['id_reservasi']!;
    http.get(Uri.parse(url));
  }

  void confirm() {
  AlertDialog alertDialog = AlertDialog(
    content: Text("Are You sure want to delete ?"),
    actions: <Widget>[
      ElevatedButton(
        child: Text("OK DELETE!",style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
        ),
        onPressed: (){
          deleteData();
          Navigator.pop(context);
          Navigator.pop(context);
          setState(() {});
        },
      ),
      ElevatedButton(
        child: Text("CANCEL",style: TextStyle(color: Colors.white)),
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
      
      appBar: AppBar(title: Text("Detail Reservasi")),
      body: Container(
        child: Card(
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text("ktp"),
                          subtitle: Text("${widget.list![widget.index!]["ktp"]}"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("daerah"),
                          subtitle: Text("${widget.list![widget.index!]["daerah"]}"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text("nama"),
                          subtitle: Text("${widget.list![widget.index!]["nama"]}"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("no_telepon"),
                          subtitle: Text("${widget.list![widget.index!]["no_telepon"]}"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text("tempat_lahir"),
                          subtitle: Text("${widget.list![widget.index!]["tempat_lahir"]}"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("pendidikan"),
                          subtitle: Text("${widget.list![widget.index!]["pendidikan"]}"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text("tanggal_lahir"),
                          subtitle: Text("${widget.list![widget.index!]["tanggal_lahir"]}"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("agama"),
                          subtitle: Text("${widget.list![widget.index!]["agama"]}"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text("jenis_kelamin"),
                          subtitle: Text("${widget.list![widget.index!]["jenis_kelamin"]}"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("pekerjaan"),
                          subtitle: Text("${widget.list![widget.index!]["pekerjaan"]}"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text("alamat"),
                          subtitle: Text("${widget.list![widget.index!]["alamat"]}"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("warga_negara"),
                          subtitle: Text("${widget.list![widget.index!]["warga_negara"]}"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text("rt"),
                          subtitle: Text("${widget.list![widget.index!]["rt"]}"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("status"),
                          subtitle: Text("${widget.list![widget.index!]["status"]}"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text("rw"),
                          subtitle: Text("${widget.list![widget.index!]["rw"]}"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("created_at"),
                          subtitle: Text("${widget.list![widget.index!]["created_at"]}"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text("kelurahan"),
                          subtitle: Text("${widget.list![widget.index!]["kelurahan"]}"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("updated_at"),
                          subtitle: Text("${widget.list![widget.index!]["updated_at"]}"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text("kecamatan"),
                          subtitle: Text("${widget.list![widget.index!]["kecamatan"]}"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=>confirm(), 
                      child: Text('Delete'),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(title: Text("${widget.list![widget.index!]['nama']}")),
    //   body: Container(

    //     padding: const EdgeInsets.all(20.0),
    //     child: Card(
    //       child: Center(
    //         child: Column(
    //           children: <Widget>[

    //             // Padding(padding: const EdgeInsets.only(top: 30.0),),
    //             // Text("KTP : ${widget.list![widget.index!]['ktp']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("nama : ${widget.list![widget.index!]['nama']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("tempat_lahir : ${widget.list![widget.index!]['tempat_lahir']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("tanggal_lahir : ${widget.list![widget.index!]['tanggal_lahir']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("jenis_kelamin : ${widget.list![widget.index!]['jenis_kelamin']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("alamat : ${widget.list![widget.index!]['alamat']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("rt : ${widget.list![widget.index!]['rt']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("rw : ${widget.list![widget.index!]['rw']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("kelurahan : ${widget.list![widget.index!]['kelurahan']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("kecamatan : ${widget.list![widget.index!]['kecamatan']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("daerah : ${widget.list![widget.index!]['daerah']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("no_telepon : ${widget.list![widget.index!]['no_telepon']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("pendidikan : ${widget.list![widget.index!]['pendidikan']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("agama : ${widget.list![widget.index!]['agama']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("pekerjaan : ${widget.list![widget.index!]['pekerjaan']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("warga_negara : ${widget.list![widget.index!]['warga_negara']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("status : ${widget.list![widget.index!]['status']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("created_at : ${widget.list![widget.index!]['created_at']}", style: TextStyle(fontSize: 18.0)),
    //             // Text("updated_at : ${widget.list![widget.index!]['updated_at']}", style: TextStyle(fontSize: 18.0)),
    //             // Padding(padding: const EdgeInsets.only(top: 30.0),),

    //             // ElevatedButton(
    //             //   child: Text("EDIT", style: TextStyle(color: Colors.white)),
    //             //   style: ElevatedButton.styleFrom(
    //             //     shape: StadiumBorder()
    //             //   ),
    //             //   onPressed: (){},
    //             //   // onPressed: ()=>Navigator.of(context).push(
    //             //   //   MaterialPageRoute(
    //             //   //     builder: (BuildContext context)=>EditData(list: widget.list!, index: widget.index!,),
    //             //   //   )
    //             //   // ),
    //             // )
    //             // Row(
    //             //   mainAxisSize: MainAxisSize.min,
    //             //   children: <Widget>[
    //             //     RaisedButton(
    //             //       child: Text("EDIT", style: TextStyle(color: Colors.white)),
    //             //       color: Colors.green,
    //             //       onPressed: (){},
    //             //       // onPressed: ()=>Navigator.of(context).push(
    //             //       //   MaterialPageRoute(
    //             //       //     builder: (BuildContext context)=>EditData(list: widget.list!, index: widget.index!,),
    //             //       //   )
    //             //       // ),
    //             //     ),
    //             //     RaisedButton(
    //             //       child: Text("DELETE", style: TextStyle(color: Colors.white)),
    //             //       color: Colors.red,
    //             //       onPressed: ()=>confirm(),
    //             //     ),
    //             //   ],
    //             // )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
