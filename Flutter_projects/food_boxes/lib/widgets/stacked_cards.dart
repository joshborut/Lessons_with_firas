import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/screens/expanded_order_screen.dart';
import 'package:food_boxes/utility/dimensions_extensions.dart';
import 'package:food_boxes/utility/shared_providers.dart';
import 'package:food_boxes/widgets/ticket_card.dart';

import '../model/food_box.dart';
import '../utility/shared_functions.dart';

class StackedCards extends ConsumerWidget {
  const StackedCards({super.key, required this.uniqueTickets});

  final List<FoodBox> uniqueTickets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: uniqueTickets.length == 1
          ? () => orderDetailsDialogue(context, ref, ticket: uniqueTickets[0])
          : () {
              ref.read(stackedTicketProvider.notifier).state = uniqueTickets;
              Navigator.pushNamed(context, ExpandedOrderScreen.routeName);
            },
      child: Center(
        child: SizedBox(
          height: context.percentHeight(38),
          width: context.percentWidth(90),
          child: Stack(
            children: [
              for (int index = 0; index < uniqueTickets.length; index++)
                Positioned(
                  bottom: context.percentHeight(0.5 + 1.5 * index),
                  child: TicketCard(
                    uniqueTicket: uniqueTickets.elementAt(index),
                    index: index,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
