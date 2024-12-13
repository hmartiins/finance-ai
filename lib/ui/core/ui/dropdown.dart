import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  Dropdown({
    super.key,
    required this.options,
    required this.selectedValue,
  });

  String selectedValue;
  final List<String> options;

  @override
  DropdownState createState() => DropdownState();
}

class DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: AppColors.light20,
        ),
      ),
      child: DropdownButton<String>(
        value: widget.selectedValue,
        isExpanded: true,
        underline: Container(),
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey.shade400,
        ),
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.dark25,
        ),
        onChanged: (String? newValue) {
          setState(() {
            widget.selectedValue = newValue!;
          });
        },
        items: widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
