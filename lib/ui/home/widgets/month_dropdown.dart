import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class MonthDropdown extends StatefulWidget {
  final Function(String) onChanged;

  const MonthDropdown({super.key, required this.onChanged});

  @override
  MonthDropdownState createState() => MonthDropdownState();
}

class MonthDropdownState extends State<MonthDropdown> {
  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  late String selectedMonth;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    selectedMonth = months[now.month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedMonth,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            selectedMonth = newValue;
          });

          widget.onChanged(selectedMonth);
        }
      },
      items: months.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
      underline: Container(),
      selectedItemBuilder: (BuildContext context) {
        return months.map<Widget>((String value) {
          return Row(
            children: [
              const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.violet100,
              ),
              const SizedBox(width: 4),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          );
        }).toList();
      },
      icon: const SizedBox.shrink(),
      style: const TextStyle(
        color: Colors.black,
      ),
      isDense: true,
    );
  }
}
