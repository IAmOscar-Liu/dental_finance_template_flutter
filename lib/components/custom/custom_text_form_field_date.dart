import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextFormFieldDate extends StatelessWidget {
  const CustomTextFormFieldDate(
      {super.key, this.initialDate = "", required this.onSelect});

  final String? initialDate;
  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialDate,
      decoration: InputDecoration(
          icon: Icon(Icons.calendar_month), //icon of text field
          hintText: "yyyy-MM-dd",
          contentPadding: EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.grey))),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          onSelect(formattedDate);
        }
      },
    );
  }
}
