import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/utility/shared_providers.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../app_constants.dart';
import '../model/food_box.dart';
import 'size_config.dart';

final _rng = Random();

int randomValue(int min, int max) {
  return min + _rng.nextInt(max - min);
}

void orderDetailsDialogue(
  WidgetRef ref, {
  required String orderNumber,
  String? orderDetails,
}) {
  showDialog(
    context: ref.context,
    builder: (BuildContext ctx) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.circleRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.scaledHeight(2),
              ),
              child: Text(
                "Order Number: #$orderNumber",
                style: TextStyle(
                  fontSize: SizeConfig.scaledHeight(3.5),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            QrImageView(
              padding: EdgeInsets.only(
                top: SizeConfig.scaledHeight(3),
                bottom: SizeConfig.scaledHeight(3),
                left: SizeConfig.scaledWidth(3.5),
              ),
              data: orderDetails ?? "Not available",
              version: QrVersions.auto,
              size: SizeConfig.scaledHeight(25),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: SizeConfig.scaledHeight(2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: SizeConfig.scaledWidth(25),
                    height: SizeConfig.scaledHeight(5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(ref.context).colorScheme.primary,
                      ),
                      onPressed: () => Navigator.of(ref.context).pop(),
                      child: Text(
                        "Back",
                        style: TextStyle(
                            fontSize: SizeConfig.scaledHeight(2),
                            color: Theme.of(ref.context).colorScheme.onPrimary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.scaledWidth(10),
                  ),
                  SizedBox(
                    width: SizeConfig.scaledWidth(25),
                    height: SizeConfig.scaledHeight(5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(ref.context).colorScheme.primary,
                      ),
                      onPressed: () async {
                        final cancelOrder = await yesNoDialogue(ref.context,
                                "Canceling an order is permanent and irreversible") ??
                            false;
                        if (cancelOrder) {
                          ref.read(ticketListProvider.notifier).update(
                              (state) => [
                                    ...state
                                      ..removeAt(int.parse(orderNumber) - 1)
                                  ]);
                        }
                        if (ctx.mounted) {
                          Navigator.of(ref.context).pop();
                        }
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: SizeConfig.scaledHeight(2),
                            color: Theme.of(ref.context).colorScheme.onPrimary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget orderSummary(WidgetRef ref, List<FoodBox> boxes) {
  final uniqueItems = Set.from(boxes);
  return Container(
    height: SizeConfig.scaledHeight(30),
    width: double.infinity,
    decoration: BoxDecoration(
        border: Border(
      top: BorderSide(
        color: AppConstants.grey600,
        width: 2,
      ),
    )),
    child: ListView.builder(
      padding: EdgeInsets.only(
        top: SizeConfig.scaledHeight(1.3),
      ),
      itemCount: uniqueItems.length,
      itemBuilder: (_, index) {
        final boxQuantity = ref.read(
          numberOfBoxesProvider(uniqueItems.elementAt(index).id),
        );
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: SizeConfig.scaledWidth(1),
                  ),
                  height: SizeConfig.scaledHeight(2.75),
                  width: SizeConfig.scaledWidth(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppConstants.grey400,
                  ),
                  child: Text(
                    boxQuantity.toString(),
                    style: TextStyle(
                      fontSize: SizeConfig.scaledHeight(1.75),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.scaledWidth(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        uniqueItems.elementAt(index).name,
                        style: TextStyle(
                          fontSize: SizeConfig.scaledHeight(2),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        uniqueItems.elementAt(index).description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppConstants.grey600,
                          fontSize: SizeConfig.scaledHeight(1.75),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    "\$${uniqueItems.elementAt(index).price * boxQuantity}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppConstants.grey800,
                      fontSize: SizeConfig.scaledHeight(1.75),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: AppConstants.grey500,
              thickness: 1,
            )
          ],
        );
      },
    ),
  );
}

Future<bool?> yesNoDialogue(BuildContext context, String messageToDisplay,
    [Widget? childWidget]) {
  return showDialog<bool>(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(0.5),
            ),
            child: Text(
              "Are you sure?",
              style: TextStyle(
                fontSize: SizeConfig.scaledHeight(2.75),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(1.5),
            ),
            child: Text(
              messageToDisplay,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          if (childWidget != null) childWidget
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            "Yes",
            style: TextStyle(
              fontSize: SizeConfig.scaledHeight(2.25),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            "No",
            style: TextStyle(
              fontSize: SizeConfig.scaledHeight(2.25),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}

SnackBar messegeSnackBar(String messege, {int? timeUp = 1000}) {
  return SnackBar(
    shape: RoundedRectangleBorder(borderRadius: AppConstants.circleRadius),
    duration: Duration(milliseconds: timeUp!),
    content: Text(
      messege,
      style: TextStyle(
        fontSize: SizeConfig.scaledHeight(2.25),
      ),
      textAlign: TextAlign.center,
    ),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      left: SizeConfig.scaledWidth(20),
      right: SizeConfig.scaledWidth(20),
      bottom: SizeConfig.scaledHeight(5),
    ),
  );
}

String formatDate(DateTime time) {
  final dateFormater = DateFormat('dd/MM/yyyy');
  return dateFormater.format(time);
}

List<FoodBox> getDateBoxes(DateTime day) {
  if (day.day == 10) {
    return [
      FoodBox(
        name: "Large Box",
        price: 20.00,
        date: DateTime(2023, 12, 10),
        description: "This is a large box of veggies",
      ),
      FoodBox(
        name: "Medium Box",
        price: 15.00,
        date: DateTime(2023, 12, 10),
        description: "This is a medium box of veggies",
      ),
      FoodBox(
        name: "Small Box",
        price: 10.00,
        date: DateTime(2023, 12, 10),
        description: "This is a small box of veggies",
      )
    ];
  } else {
    return [];
  }
}

Future<void> deleteAccount(BuildContext context) async {
  final value = await yesNoDialogue(
        context,
        "Deleting your account is permanent and irreversible",
      ) ??
      false;
  if (value) {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      print("Failed with error code: ${e.code}");
      String snackBarMessege;
      if (e.code == "requires-recent-login") {
        snackBarMessege = "Recent login is required. "
            "Please logout and log back in.";
      } else {
        snackBarMessege = e.message!;
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          messegeSnackBar(
            snackBarMessege,
            timeUp: 1750,
          ),
        );
      }
    } catch (e) {
      print("Caught exception: $e");
    }
  }
}
