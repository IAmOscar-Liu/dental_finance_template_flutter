import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu(
      {super.key,
      required this.labelname,
      this.initialSelection = "請選擇",
      required this.menuSelections,
      required this.onSelect,
      this.width,
      this.errorText});

  final String labelname;
  final String? initialSelection;
  final List<String> menuSelections;
  final Function onSelect;
  final double? width;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<String>> entries =
        <DropdownMenuEntry<String>>[];

    // entries.add(DropdownMenuEntry(value: "請選擇", label: "請選擇", enabled: false));
    for (int i = 0; i < menuSelections.length; i++) {
      entries.add(DropdownMenuEntry<String>(
        value: menuSelections[i],
        label: menuSelections[i],
      ));
    }

    return DropdownMenu<String>(
      initialSelection: initialSelection,
      label: Text(labelname),
      width: width,
      dropdownMenuEntries: entries,
      errorText: errorText,
      onSelected: (value) {
        onSelect(value);
      },
    );
  }
}
