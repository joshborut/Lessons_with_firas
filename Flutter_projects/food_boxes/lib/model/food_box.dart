import 'package:uuid/uuid.dart';

class FoodBox {
  FoodBox({
    required this.name,
    required this.price,
    required this.date,
    this.description = "",
    this.imageURL = "assets/images/veggie_scale.jpg",
  }) {
    var uuid = Uuid();
    id = uuid.v4();
  }

  final String name;
  final double price;
  final DateTime date;
  final String description;
  final String? imageURL;
  late final String id;
}

// class ExampleBoxes {
//   factory ProdHttpClient() => _instance;

//   ProdHttpClient._internal();

//   static final _instance = ProdHttpClient._internal();

//   final Client client = Client();

//   void close() => client.close();
// }
