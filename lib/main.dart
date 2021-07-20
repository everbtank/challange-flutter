import 'dart:async';
import 'package:flutter/material.dart';
import 'package:challange/components/datos.dart';
import 'package:challange/components/logica.dart';
import 'package:challange/theme.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;
  late Future<Texto> futureTexto;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futureTexto = fetchTexto();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Challenger',
      theme: theme(),
  
      home: Scaffold(
        appBar: AppBar(
          title: Text('Challenger'),
        ),
      
        body: Container(
          
          child:  Column(
          children: <Widget> [
          FutureBuilder<Texto>(
              future: futureTexto,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.texto);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          
          FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Image.network(snapshot.data!.img, width: 450, height: 400, fit: BoxFit.contain,);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
          ],
          ),
        ), floatingActionButton: MaterialButton(
              disabledColor: Colors.amber,
              child: Text("Next fact"),
              splashColor: Colors.amber,
              color: Colors.blueAccent,
              onPressed: ()  {
              Navigator.push(    context, new MaterialPageRoute(
              builder: (context) => this.build(context)));
                setState(() {});
                print("Hola Raised Button");
                
              },
              ),
      ),
    );
  }
}