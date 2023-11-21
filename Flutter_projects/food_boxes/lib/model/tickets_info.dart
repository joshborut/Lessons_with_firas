class TicketsInfo {
  const TicketsInfo({
    required this.name,
    required this.date,
    required this.price,
    this.imageURL = "assets/images/veggie_scale.jpg",
  });

  final String name;
  final String date;
  final int price;
  final String? imageURL;
}
