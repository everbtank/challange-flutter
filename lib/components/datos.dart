

class Album {
 
  final String img;

  Album({

    required this.img,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
    
      img: json['link'],
    );
  }
}

class   Texto {

  final String texto;

   Texto({
    required this.texto,
  });

  factory  Texto.fromJson(Map<String, dynamic> json) {
    return  Texto(
      texto: json['fact'],
   
    );
  }
}