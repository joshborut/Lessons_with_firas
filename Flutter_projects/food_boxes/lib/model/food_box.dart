class FoodBox {
  const FoodBox({
    required this.name,
    required this.price,
    required this.date,
    this.description = "",
    this.imageURL = "assets/images/veggie_scale.jpg",
  });

  final String name;
  final double price;
  final DateTime date;
  final String description;
  final String? imageURL;
}
