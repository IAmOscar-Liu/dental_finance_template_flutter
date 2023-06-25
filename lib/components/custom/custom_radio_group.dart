import 'package:flutter/material.dart';

class CustomRadioGroup<T> extends StatelessWidget {
  const CustomRadioGroup(
      {super.key,
      required this.fallbackValue,
      required this.groupOptions,
      required this.groupValue,
      required this.onChange});

  final T fallbackValue;
  final List<T> groupOptions;
  final T groupValue;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 6,
      children: groupOptions
          .map((option) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    value: option,
                    groupValue: groupValue,
                    onChanged: (T? value) {
                      onChange(value ?? fallbackValue);
                    },
                  ),
                  Text(option.toString()),
                ],
              ))
          .toList(),
    );
  }
}
