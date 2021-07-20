import 'dart:convert';
import 'package:challange/components/datos.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://some-random-api.ml/img/dog'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Texto> fetchTexto() async {

  final response1 =await http.get(Uri.parse('https://some-random-api.ml/facts/dog'));
 

  if (response1.statusCode == 200   ) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    
    return Texto.fromJson(jsonDecode(response1.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load texto');
  }

  
}