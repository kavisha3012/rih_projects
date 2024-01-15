import 'package:flutter/material.dart';

class CommonDropDown extends StatelessWidget {
  const CommonDropDown(
      {super.key,
      required this.items,
      required this.selectedItem,
      required this.onChange});
  final List<String> items;
  final String selectedItem;
  final Function(String?) onChange;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedItem,
      items: items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                ), // Use a value that indicates no selection
              ))
          .toList(),
      onChanged: onChange,
      isExpanded: true,
    );
  }
}
