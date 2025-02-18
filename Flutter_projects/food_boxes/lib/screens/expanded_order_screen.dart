import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/utility/dimensions_extensions.dart';
import 'package:food_boxes/utility/shared_functions.dart';
import 'package:food_boxes/utility/shared_providers.dart';
import 'package:food_boxes/utility/ticket_list_notifier.dart';

import '../widgets/ticket_card.dart';

class ExpandedOrderScreen extends ConsumerWidget {
  const ExpandedOrderScreen({super.key});

  static const routeName = "order";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketListNotifier = ref.read(ticketListProvider.notifier);
    final stackedTicketListController =
        ref.read(stackedTicketProvider.notifier);
    final ticketList = ref.read(ticketListProvider);
    final stackedTickets = ref.read(stackedTicketProvider);
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(
          top: context.percentHeight(10),
        ),
        itemCount: stackedTickets.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => orderDetailsDialogue(
              context,
              ticketListNotifier,
              stackedTicketListController,
              ticketList,
              ticket: stackedTickets[index],
            ),
            child: Center(
              child: TicketCard(
                uniqueTicket: stackedTickets[index],
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}
