import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu(
      {super.key,
      required this.labelname,
      required this.menuSelections,
      required this.onSelect});

  final String labelname;
  final List<String> menuSelections;
  final Function onSelect;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  final TextEditingController controller = TextEditingController();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<String>> entries =
        <DropdownMenuEntry<String>>[];

    // entries.add(DropdownMenuEntry(value: "請選擇", label: "請選擇", enabled: false));
    for (int i = 0; i < widget.menuSelections.length; i++) {
      entries.add(DropdownMenuEntry<String>(
        value: widget.menuSelections[i],
        label: widget.menuSelections[i],
      ));
    }

    return DropdownMenu<String>(
      initialSelection: "請選擇",
      controller: controller,
      label: Text(widget.labelname),
      dropdownMenuEntries: entries,
      onSelected: (value) {
        setState(() {
          selectedValue = value;
        });
        widget.onSelect(value);
      },
    );
  }
}
