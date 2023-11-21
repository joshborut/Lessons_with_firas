import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/app_constants.dart';
import 'package:food_boxes/model/tickets_info.dart';
import 'package:food_boxes/utility/shared_providers.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utility/shared_functions.dart';
import '../utility/size_config.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          calendarStyle: CalendarStyle(
            cellMargin: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(1),
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: Theme.of(context).textTheme.bodySmall!,
            weekendStyle: Theme.of(context).textTheme.bodySmall!,
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            ref.read(ticketListProvider.notifier).update((state) => [
                  ...state,
                  TicketsInfo(
                    date: "1/1/23",
                    name: "Crossant",
                    imageURL: AppConstants.ticketImages[randomValue(0, 7)],
                    price: 5,
                  ),
                ]);
          },
          child: Text(
            "Create Ticket",
            style: TextStyle(
              fontSize: SizeConfig.scaledHeight(2),
            ),
          ),
        ),
        Spacer(
          flex: 3,
        )
      ],
    );
  }
}
