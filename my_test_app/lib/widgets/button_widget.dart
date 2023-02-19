import 'package:flutter/widgets.dart';

class ButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String buttonText;
  const ButtonWidget(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 15,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24,
              color: textColor,
            ),
          ),
        ));
  }
}
