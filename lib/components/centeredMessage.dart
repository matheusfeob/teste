import "package:flutter/material.dart";

class CenteredMessage extends StatelessWidget {
  final String message;
  final IconData? icon;
  final double textSize;
  final double iconSize;

  CenteredMessage(
    this.message, {
    this.icon,
    this.textSize = 18,
    this.iconSize = 64,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            child: Icon(
              icon,
              size: iconSize,
            ),
            visible: icon != null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              message,
              style: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
