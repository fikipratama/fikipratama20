import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget{
  Produk produk;
  ProdukDetail({this.produk});
  @override
  _ProdukDetailState createState()=> _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode : ${widget.produk.kodeProduk}",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk.namaProduk}",
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : ${widget.produk.hargaProduk.toString()}",
              style: TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

Widget _tombolHapusEdit() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [

      //Tombol Edit
      ElevatedButton(
        child: Text("UBAH"), 
        style : ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)), 
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => ProdukForm(produk: widget.produk,)));
        }),
        
        //Tombol Hapus
        ElevatedButton(
          child: Text("HAPUS"), 
          style : ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
          onPressed: ()=>confirmHapus()),
    ],
  );
}

void confirmHapus() {
  AlertDialog alertDialog = AlertDialog(
    content: Text("Yakin ingin menghapus data ini?"),
    actions: [
      //tombol hapus
      ElevatedButton(
        child: Text("Ya"),
        style : ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
        onPressed: (){},
      ),
      
      //tombol batal
      ElevatedButton(
        child: Text("Batal"),
        style : ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
        onPressed: ()=> Navigator.pop(context),
      )
    ],
  );

  showDialog(context: context, builder: (_)=> alertDialog);
 }
}