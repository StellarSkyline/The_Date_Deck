import 'package:flutter/material.dart';

class PopupDialogHelper {
  static Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    required String description,
    required String btn1Title,
    required String btn2Title,
    required ValueChanged onPress,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => PopupDialog(title: title, description: description, btn1Title: btn1Title, btn2Title: btn2Title, onPress: onPress),
    );
  }
}

class PopupDialog extends StatelessWidget {
  final String title;
  final String description;
  final String btn1Title;
  final String btn2Title;
  final ValueChanged onPress;

  const PopupDialog({super.key, required this.title, required this.description, required this.btn1Title, required this.btn2Title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF0D2240),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Color(0xFF4E81EE), width: 0.5),
      ),
      title: Text(
        title,
        style: TextStyle(color: Color(0xFF4E81EE), fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: Text(description, style: TextStyle(color: Color(0xFF949AA6), fontSize: 15)),
      actions: [
        TextButton(
          onPressed: () => onPress(0),
          child: Text(btn1Title, style: TextStyle(color: Color(0xFF949AA6), fontSize: 15)),
        ),
        TextButton(
          onPressed: () => onPress(1),
          child: Text(btn2Title, style: TextStyle(color: Colors.red, fontSize: 15)),
        ),
      ],
    );
  }
}
