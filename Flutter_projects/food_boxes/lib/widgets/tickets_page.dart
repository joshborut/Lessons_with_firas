import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/app_constants.dart';
import 'package:food_boxes/utility/shared_functions.dart';
import 'package:food_boxes/widgets/no_ticket_container.dart';

import '../app_icons.dart';
import '../utility/size_config.dart';
import '../utility/ticket_list_notifier.dart';

class TicketsPage extends ConsumerWidget {
  const TicketsPage({super.key});

  Widget innerRow(IconData iconData, String text) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.black,
          size: SizeConfig.scaledHeight(2.5),
        ),
        SizedBox(
          width: SizeConfig.scaledWidth(3),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: SizeConfig.scaledHeight(2.5),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketList = ref.watch(ticketListProvider);
    final groupedBoxesByDate =
        ref.watch(ticketListProvider.notifier).getBoxesForDate();
    if (ticketList.isEmpty) {
      return NoTicketContainer();
    }
    return ListView.builder(
      itemCount: groupedBoxesByDate.keys.length,
      itemBuilder: (_, index) {
        final uniqueTickets =
            Set.from(groupedBoxesByDate.values.elementAt(index));
        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              groupedBoxesByDate.keys.elementAt(index),
              style: TextStyle(
                fontSize: SizeConfig.scaledHeight(7.5),
                color: Colors.black,
              ),
            ),
            ...groupedBoxesByDate.values.elementAt(index).map((e) {
              final ticketQuantity = ref
                  .read(ticketListProvider.notifier)
                  .getNumberOfTickets(uniqueTickets.elementAt(0).id);
              return GestureDetector(
                onTap: () => orderDetailsDialogue(
                  ref,
                  orderNumber: "${index + 1}",
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: AppConstants.circleRadius,
                  ),
                  elevation: 4,
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.scaledHeight(1.5),
                    horizontal: SizeConfig.scaledWidth(3),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: SizeConfig.scaledHeight(30),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                    uniqueTickets.elementAt(index).imageURL!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: SizeConfig.scaledHeight(2),
                            right: SizeConfig.scaledWidth(1),
                            child: Container(
                              width: SizeConfig.scaledWidth(70),
                              padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.scaledHeight(1),
                                horizontal: SizeConfig.scaledWidth(1.5),
                              ),
                              color: Colors.black54,
                              child: Text(
                                "${uniqueTickets.elementAt(index).name} x$ticketQuantity",
                                style: TextStyle(
                                  fontSize: SizeConfig.scaledHeight(3.5),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.scaledHeight(3),
                          horizontal: SizeConfig.scaledWidth(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            innerRow(
                              AppIcons.calendar,
                              formatDate(uniqueTickets.elementAt(index).date),
                            ),
                            innerRow(
                              Icons.attach_money,
                              (uniqueTickets.elementAt(index).price *
                                      ticketQuantity)
                                  .toStringAsFixed(2),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
