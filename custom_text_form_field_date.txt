import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextFormFieldDate extends StatefulWidget {
  const CustomTextFormFieldDate({super.key, this.initialDate = "", required this.onSelect});

  final String? initialDate; 
  final Function onSelect;

  @override
  State<CustomTextFormFieldDate> createState() =>
      _CustomTextFormFieldDateState();
}

class _CustomTextFormFieldDateState extends State<CustomTextFormFieldDate> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = widget.initialDate ?? ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateinput, //editing controller of this TextField
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
          widget.onSelect(formattedDate);
          setState(() {
            dateinput.text =
                formattedDate; //set output date to TextField value.
          });
        }
      },
    );
  }
}
