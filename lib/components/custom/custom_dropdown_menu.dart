import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu(
      {super.key,
      required this.labelname,
      this.initialSelection = "請選擇",
      required this.menuSelections,
      required this.onSelect});

  final String labelname;
  final String? initialSelection;
  final List<String> menuSelections;
  final Function onSelect;

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
      dropdownMenuEntries: entries,
      onSelected: (value) {
        onSelect(value);
      },
    );
  }
}
