import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/food_box.dart';
import 'shared_providers.dart';

final ticketListProvider =
    NotifierProvider<TicketListNotifier, List<FoodBox>>(TicketListNotifier.new);

class TicketListNotifier extends Notifier<List<FoodBox>> {
  @override
  build() => [];

  int getNumberOfTickets(String id) {
    return state.where((FoodBox element) => element.id == id).length;
  }

  void updateList() {
    final selectedBoxes = ref.read(selectedBoxesProvider);
    state = [
      ...state,
      ...selectedBoxes,
    ];
  }

  void removeElement(String orderNumber) {
    state = [...state..removeAt(int.parse(orderNumber) - 1)];
  }
}
