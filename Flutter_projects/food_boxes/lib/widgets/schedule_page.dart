import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/utility/utils.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../app_constants.dart';
import '../model/food_box.dart';
import '../model/tickets_info.dart';
import '../utility/shared_functions.dart';
import '../utility/shared_providers.dart';
import '../utility/size_config.dart';
import 'food_box_tile.dart';

class SchedulePage extends ConsumerStatefulWidget {
  const SchedulePage({super.key});

  @override
  ConsumerState<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends ConsumerState<SchedulePage> {
  late DateTime _selectedDay;
  late List<FoodBox> foodBoxes;

  @override
  void initState() {
    _selectedDay = DateTime.now();
    foodBoxes = getkEvents(_selectedDay);
    super.initState();
  }

  String _fixTimeZone(DateTime time) {
    final _dateFormater = DateFormat('dd/MM/yyyy');
    return _dateFormater.format(time);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.scaledHeight(10),
        ),
        TableCalendar(
          eventLoader: getkEvents,
          selectedDayPredicate: (day) {
            return day == _selectedDay;
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              foodBoxes = getkEvents(_selectedDay);
            });
          },
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          calendarStyle: CalendarStyle(
            cellMargin: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(1),
            ),
            todayTextStyle: TextStyle(
              color: Color.fromARGB(255, 0, 17, 255),
            ),
            todayDecoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
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
        Expanded(
          child: ListView.builder(
            itemCount: foodBoxes.length,
            itemBuilder: (_, index) {
              return FoodBoxTile(
                foodBox: foodBoxes[index],
              );
            },
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            ref.read(ticketListProvider.notifier).update((state) => [
                  ...state,
                  TicketsInfo(
                    date: _fixTimeZone(_selectedDay),
                    name: "Crossant",
                    imageURL: AppConstants.ticketImages[randomValue(0, 7)],
                    price: 5,
                  ),
                ]);
            ScaffoldMessenger.of(context).showSnackBar(
              messegeSnackBar("Ticket successfully created."),
            );
          },
          child: Text(
            "Create Ticket",
            style: TextStyle(
              fontSize: SizeConfig.scaledHeight(2),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
