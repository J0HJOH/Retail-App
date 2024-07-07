class ProductItem{
  final  String title;
  final String pricing;
  final List<String> images;
  int currentIndex;

  ProductItem({required this.title,
    required this.images, required this.pricing, this.currentIndex = 0
  });
}