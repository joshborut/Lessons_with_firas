import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/utility/preference_box.dart';

import '../utility/size_config.dart';

class TextCheckBox extends ConsumerWidget {
  const TextCheckBox({
    required this.provider,
    super.key,
  });

  final StateProvider<bool> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAlert = ref.watch(provider);
    return SizedBox(
      height: SizeConfig.scaledHeight(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't ask me again.",
            style: TextStyle(
              fontSize: SizeConfig.scaledHeight(2.75),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Checkbox(
              value: !showAlert,
              onChanged: (value) {
                ref.read(provider.notifier).state = value!;
                PreferenceBox.getInstance().setConfirmLogoutToggle(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
