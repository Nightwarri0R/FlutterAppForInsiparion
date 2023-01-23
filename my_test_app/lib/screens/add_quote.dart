import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_test_app/utils/app_colors.dart';
import 'package:my_test_app/widgets/button_widget.dart';
import 'package:my_test_app/widgets/text_field_widget.dart';

class AddQuotePage extends StatelessWidget {
  const AddQuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    TextEditingController descriptionEditingController =
        TextEditingController();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    AssetImage("assets/istockphoto-1320753789-612x612.jpg"))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  IconButton(
                      onPressed: () {
                        return;
                      },
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        color: AppColors.buttonColor,
                      ))
                ],
              ),
              Column(
                children: [
                  TextFieldWidget(
                    textController: textEditingController,
                    placeHolderText: "Add Quote",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFieldWidget(
                    textController: descriptionEditingController,
                    placeHolderText: "Author name",
                    borderRadius: 20,
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const ButtonWidget(
                      backgroundColor: AppColors.buttonColor,
                      textColor: AppColors.buttonTextColor,
                      buttonText: "Add Quote")
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              )
            ]),
      ),
    );
  }
}
