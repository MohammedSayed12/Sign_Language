class UserModel{
  String? name;
  String? email;
  String? password;
  String? id;
  String? image;

  UserModel({this.name, this.email, this.password, this.id, this.image});

  UserModel.fromJson(json){
    name=json["name"];
    email=json["email"];
    password=json["password"];
    id=json["id"];
    image=json["image"];
  }

  Map<String,dynamic>toMap(){
    return{
      "name":name,
      "email":email,
      "password": password,
      "id": id,
      "image": image,
  };
  }

}