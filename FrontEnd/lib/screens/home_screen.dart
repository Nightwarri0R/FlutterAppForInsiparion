import 'package:flutter/material.dart';
import 'package:my_test_app/screens/view_inspirational_quote..dart';
import 'package:my_test_app/utils/app_colors.dart';
import 'package:my_test_app/widgets/button_widget.dart';
import 'package:get/get.dart';

import 'add_quote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        // ignore: sort_child_properties_last
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                // ignore: prefer_const_constructors
                text: TextSpan(
                    text: "Inspiration Hub",
                    style: const TextStyle(
                      color: AppColors.titleColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const [
                  TextSpan(
                      text: "\nReady to be inspired?",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 16,
                      )),
                ])),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            InkWell(
              onTap: () {
                Get.to(() => AddQuotePage(),
                    transition: Transition.fade,
                    duration: Duration(seconds: 1));
              },
              child: const ButtonWidget(
                  backgroundColor: AppColors.buttonColor,
                  textColor: AppColors.buttonTextColor,
                  buttonText: "Add Quote"),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Get.to(() => ViewQuote(),
                    transition: Transition.fade,
                    duration: Duration(seconds: 1));
              },
              child: const ButtonWidget(
                  backgroundColor: AppColors.addButtontColor,
                  textColor: AppColors.addTextbuttonColor,
                  buttonText: "Get Inspirational Quotes"),
            ),
          ],
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/inspiration.jpg"))),
      ),
    );
  }
}
