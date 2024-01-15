import 'package:flutter/material.dart';
import '../Utils/constants.dart';

class CommonAppBarScreen extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final bool centerTitle;
  final bool isBackArrow;
  final bool automaticallyImplyLeading;

  CommonAppBarScreen({
    required this.title,
    required this.backgroundColor,
    this.centerTitle = true,
    this.isBackArrow = true,
    this.automaticallyImplyLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackArrow ? BackButton(color: blackColor) : SizedBox(),
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(
          color: blackColor, // Customize the text color if needed
        ),
      ),
      centerTitle: centerTitle,
      actions: [
        PopupMenuButton(
          color: Colors.black,
          itemBuilder: (context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem(
                child: Text('Item 1'),
                textStyle: TextStyle(color: Colors.tealAccent),
              ),
              PopupMenuItem(
                child: Text('Item 2'),
                textStyle: TextStyle(backgroundColor: Colors.amber),
              ),
            ];
          },
        )
      ],
    );
  }
}
