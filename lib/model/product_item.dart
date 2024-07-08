class ProductItem{
  final  String title;
  final String pricing;
  final List<String> images;
  String description;
  int currentIndex;

  ProductItem({required this.title, this.description = '',
    required this.images, required this.pricing, this.currentIndex = 0
  });
}