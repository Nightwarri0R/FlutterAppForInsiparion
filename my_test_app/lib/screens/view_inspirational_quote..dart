// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:my_test_app/utils/app_colors.dart';
import 'package:my_test_app/widgets/quote_widgetg.dart';

class ViewQuote extends StatelessWidget {
  const ViewQuote({super.key});
//
  @override
  Widget build(BuildContext context) {
    List myQuotes = ["Test1", "Test2"];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 97, 154, 180),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/lockscreen-wallpapers-quote-backgrounds-1.jpg"))),
            child: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    // ignore: sort_child_properties_last
                    child: const Icon(Icons.add, color: Colors.black, size: 20),
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(width: 285),
                  const Icon(
                    Icons.add_chart,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "2",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              )),
          Container(
              child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: myQuotes.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      child: QuotesWidget(
                        quote: myQuotes[index],
                        color: Colors.black,
                      ),
                    );
                  }))),

          //This needs to be completed for quote widget, I was at 56,34 min of the tutorial.
        ],
      ),
    );
  }
}
