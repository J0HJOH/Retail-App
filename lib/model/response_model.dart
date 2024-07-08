class ResponseModel {
  final int id;
  final String productName;
  final String description;
  final List<String> image;
  final int price;



  const ResponseModel({
    required this.id,
    required this.productName,
    required this.image,
    required this.description,
    required this.price
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'current_price': int price,
      'id': int id,
      'description' : String description,
      'photos' : List<String> photos,
      'name': String productName,
      } =>
          ResponseModel(
            id: id,
            productName: productName,
            image: photos,
            description: description,
            price: price
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }


}