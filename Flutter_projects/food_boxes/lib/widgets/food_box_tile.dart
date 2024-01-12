import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../model/food_box.dart';
import '../utility/shared_providers.dart';
import '../utility/size_config.dart';

class FoodBoxTile extends ConsumerStatefulWidget {
  const FoodBoxTile({
    super.key,
    required this.passedFoodBox,
  });

  final FoodBox passedFoodBox;

  @override
  ConsumerState<FoodBoxTile> createState() => _FoodBoxTileState();
}

class _FoodBoxTileState extends ConsumerState<FoodBoxTile> {
  late bool tileIsSelected;
  late Color tileBgColor;

  @override
  void initState() {
    tileIsSelected = false;
    tileBgColor = Colors.grey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedBoxes = ref.watch(selectedBoxesProvider);
    return Card(
      color: Theme.of(context).colorScheme.background,
      elevation: 0,
      child: ListTile(
        onTap: () {
          if (selectedBoxes.contains(widget.passedFoodBox)) {
            ref.read(selectedBoxesProvider.notifier).update((state) => [
                  ...state..remove(widget.passedFoodBox),
                ]);
          }
          if (!tileIsSelected) {
            ref.read(selectedBoxesProvider.notifier).update((state) => [
                  ...state,
                  widget.passedFoodBox,
                ]);
          }
          setState(() {
            tileBgColor = tileIsSelected
                ? Colors.grey
                : Theme.of(context).colorScheme.primary;
            tileIsSelected = !tileIsSelected;
          });
        },
        tileColor: tileBgColor,
        leading: Icon(
          Icons.verified_user,
          size: SizeConfig.scaledHeight(5),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.circleRadius,
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.scaledHeight(0.5),
          ),
          child: Text(
            widget.passedFoodBox.name,
          ),
        ),
        subtitle: Text(
          widget.passedFoodBox.description,
        ),
      ),
    );
  }
}
