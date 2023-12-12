import 'package:food_boxes/model/food_box.dart';

List<FoodBox> getkEvents(DateTime day) {
  if (day.day == 10) {
    return [
      FoodBox(
          name: "Large Box",
          price: 20.00,
          date: DateTime(2023, 12, 10),
          description: "This is a large box of veggies")
    ];
  } else {
    return [];
  }
}

// final _kEventSource = {
//   for (var item in List.generate(50, (index) => index))
//     DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
//         item % 4 + 1, (index) => Event('Event $item | ${index + 1}'))
// }..addAll({
//     kToday: [
//       Event('Today\'s Event 1'),
//       Event('Today\'s Event 2'),
//     ],
//   });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
