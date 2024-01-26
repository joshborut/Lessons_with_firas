import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../model/food_box.dart';
import '../utility/shared_providers.dart';
import '../utility/size_config.dart';

class FoodBoxTile extends ConsumerStatefulWidget {
  const FoodBoxTile({
    super.key,
    required this.passedBox,
  });

  final FoodBox passedBox;

  @override
  ConsumerState<FoodBoxTile> createState() => _FoodBoxTileState();
}

class _FoodBoxTileState extends ConsumerState<FoodBoxTile> {
  late Color tileBgColor;

  @override
  void initState() {
    tileBgColor = AppConstants.grey500;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (ref
        .read(selectedBoxesProvider)
        .any((e) => e.id == widget.passedBox.id)) {
      tileBgColor = Theme.of(context).colorScheme.primary;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final selectedBoxes = ref.watch(selectedBoxesProvider);
    return Card(
      color: Theme.of(context).colorScheme.background,
      elevation: 0,
      child: ListTile(
        visualDensity: VisualDensity(vertical: 3), // to expand
        onTap: () {
          if (selectedBoxes.any((e) => e.id == widget.passedBox.id)) {
            ref.read(selectedBoxesProvider.notifier).update((state) => [
                  ...state..remove(widget.passedBox),
                ]);
            setState(() => tileBgColor = AppConstants.grey500);
          } else {
            ref.read(selectedBoxesProvider.notifier).update((state) => [
                  ...state,
                  widget.passedBox,
                ]);
            setState(() => tileBgColor = Theme.of(context).colorScheme.primary);
          }
        },
        tileColor: tileBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.circleRadius,
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.scaledHeight(0.5),
          ),
          child: Text(
            widget.passedBox.name,
          ),
        ),
        subtitle: Text(
          widget.passedBox.description,
        ),
        trailing: Column(
          children: [
            Icon(
              Icons.add,
              size: SizeConfig.scaledHeight(2.5),
            ),
            Container(
              height: SizeConfig.scaledHeight(3),
              width: SizeConfig.scaledWidth(5),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.scaledHeight(0.5),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                "0",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.scaledHeight(2),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.remove,
              size: SizeConfig.scaledHeight(2.5),
            ),
          ],
        ),
      ),
    );
  }
}
