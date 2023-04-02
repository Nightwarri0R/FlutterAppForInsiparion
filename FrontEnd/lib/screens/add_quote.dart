import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_test_app/controllers/data_controller.dart';
import 'package:my_test_app/screens/view_inspirational_quote..dart';
import 'package:my_test_app/utils/app_colors.dart';
import 'package:my_test_app/widgets/button_widget.dart';
import 'package:my_test_app/widgets/error_message.dart';
import 'package:my_test_app/widgets/text_field_widget.dart';

class AddQuotePage extends StatelessWidget {
  const AddQuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController quoteDescriptionController = TextEditingController();
    TextEditingController authorController = TextEditingController();

    bool dataValidation() {
      if (quoteDescriptionController.text.trim() == '') {
        Message.errorMesage("Quote", "Quote cannot be empty");
        return false;
      } else if (authorController.text.trim() == '') {
        Message.errorMesage("Author name", "Author name cannot be empty");
        return false;
      }

      return false;
    }

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
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_sharp,
                        color: AppColors.buttonColor,
                      ))
                ],
              ),
              Column(
                children: [
                  TextFieldWidget(
                    textController: quoteDescriptionController,
                    placeHolderText: "Add Quote",
                    borderRadius: 20,
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFieldWidget(
                      textController: authorController,
                      placeHolderText: "Author name"),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (dataValidation()) {
                        Get.find<DataController>().postQuotes(
                            quoteDescriptionController.text.trim(),
                            authorController.text.trim());
                        Get.to(() => const ViewQuote(),
                            transition: Transition.circularReveal);
                      }
                    },
                    // ignore: prefer_const_constructors
                    child: ButtonWidget(
                        backgroundColor: AppColors.buttonColor,
                        textColor: AppColors.buttonTextColor,
                        buttonText: "Add Quote"),
                  )
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
