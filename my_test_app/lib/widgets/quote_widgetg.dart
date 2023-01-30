import 'package:flutter/material.dart';

class QuotesWidget extends StatelessWidget {
  final String quote;
  final Color color;
  const QuotesWidget({super.key, required this.quote, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        quote,
        style: TextStyle(fontSize: 20, color: color),
      ),
    );
  }
}
