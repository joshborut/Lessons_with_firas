import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../app_constants.dart';
import '../model/food_box.dart';
import '../utility/shared_functions.dart';
import '../utility/shared_providers.dart';
import '../utility/size_config.dart';
import '../utility/ticket_list_notifier.dart';
import 'food_box_tile.dart';

class SchedulePage extends ConsumerStatefulWidget {
  const SchedulePage({super.key});

  @override
  ConsumerState<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends ConsumerState<SchedulePage> {
  final PageController _controller = PageController(viewportFraction: 0.9);
  late DateTime _selectedDay;
  late List<FoodBox> _foodBoxes;

  @override
  void initState() {
    _selectedDay = DateTime.now();
    _foodBoxes = getDateBoxes(_selectedDay);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedBoxes = ref.watch(selectedBoxesProvider);
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.scaledHeight(10),
        ),
        TableCalendar(
          eventLoader: getDateBoxes,
          selectedDayPredicate: (day) {
            return day == _selectedDay;
          },
          onDaySelected: (selectedDay, focusedDay) {
            ref.read(selectedBoxesProvider.notifier).state = [];
            setState(() {
              _selectedDay = selectedDay;
              _foodBoxes = getDateBoxes(_selectedDay);
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
              color: Color(0xFF5C6BC0),
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
        Spacer(),
        if (_foodBoxes.isEmpty)
          Container(
            decoration: BoxDecoration(
              borderRadius: AppConstants.circleRadius,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            margin: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(2),
              horizontal: SizeConfig.scaledWidth(7.5),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.scaledWidth(4),
                vertical: SizeConfig.scaledHeight(2),
              ),
              child: Text(
                "No food boxes available for the selected date. Please choose another date.",
                style: TextStyle(
                  fontSize: SizeConfig.scaledHeight(2.5),
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        else
          Container(
            margin: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(2),
            ),
            height: SizeConfig.scaledHeight(14),
            child: PageView(
              controller: _controller,
              children: List.generate(
                _foodBoxes.length,
                (index) {
                  return FoodBoxTile(
                    passedBox: _foodBoxes[index],
                  );
                },
              ),
            ),
          ),
        Spacer(),
        GestureDetector(
          onTap: selectedBoxes.isNotEmpty
              ? () async {
                  final orderConfirmed = await yesNoDialogue(
                        context,
                        "Confirm order to proceed to checkout",
                        orderSummary(ref, selectedBoxes),
                      ) ??
                      false;
                  if (orderConfirmed) {
                    ref.read(ticketListProvider.notifier).updateList();
                    ref.read(selectedBoxesProvider.notifier).state = [];
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        messegeSnackBar("Ticket successfully created."),
                      );
                    }
                  }
                }
              : null,
          child: Container(
            width: SizeConfig.scaledWidth(30),
            height: SizeConfig.scaledHeight(7),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: AppConstants.circleRadius,
              color: selectedBoxes.isNotEmpty
                  ? Theme.of(context).colorScheme.primary
                  : AppConstants.grey500,
            ),
            child: Text(
              "Create Ticket",
              style: TextStyle(
                fontSize: SizeConfig.scaledHeight(2),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
