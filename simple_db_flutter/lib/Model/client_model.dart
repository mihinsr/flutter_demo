class Client{
  int id;
  String name;
  String image;
  String discription;

  Client ({this.id, this.name, this.image, this.discription});


  //To insert the data in the bd, we need to convert it into a Map
  //Para insertar los datos en la bd, necesitamos convertirlo en un Map
  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "image": image,
    "discription": discription,
  };

  //to receive the data we need to pass it from Map to json
  //para recibir los datos necesitamos pasarlo de Map a json
  factory Client.fromMap(Map<String, dynamic> json) => new Client(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    discription: json["discription"],
    );
}