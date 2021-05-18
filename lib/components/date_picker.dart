import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  BuildContext context;
  DatePicker({
    Key? key,
    required this.context,
  }) : super(key: key);
  // DatePicker(this.context, {Key key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _date = DateTime(2021);
  TextEditingController _datecontroller = new TextEditingController();
  var myFormat = DateFormat('dd/MM/yyyy');
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = (await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050)))!;
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _datecontroller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        suffixIcon:
            Icon(Icons.calendar_today, color: Colors.orange.shade900, size: 35),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFFEE4300),
        )),
        labelText: "Data de Nascimento:",
        hintText: ('${myFormat.format(_date)}'),
        // hintText: ('${myFormat.format(currentDate)}'),
        labelStyle: TextStyle(
          color: Color(0xFF000000),
          fontWeight: FontWeight.w500,
          fontSize: 19,
        ),
      ),
      onTap: () => _selectDate(context),
    );
  }
}
