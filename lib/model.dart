class ImageModel{
  final int id ;
  final String largeImageURL;

  ImageModel({
    required this.id,
    required this.largeImageURL,
});

  factory ImageModel.fromJson(Map<String,dynamic>json){
    return ImageModel(
      id: json['id'],
      largeImageURL: json['largeImageURL'],
    );
  }
}