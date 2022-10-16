class GetImage{
  String? video;
  List<String>? videoName;
  GetImage.fromJson(json){
    json.forEach((key,value) {
      videoName!.add(value[key]);
    });
  }
}