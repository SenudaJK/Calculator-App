import 'package:calculator_app/Constants/colors.dart';
import 'package:calculator_app/Provider/cal_provider.dart';
import 'package:calculator_app/Screens/widget_data.dart';
import 'package:calculator_app/widget/calButton.dart';
import 'package:calculator_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final screenHeight = MediaQuery.sizeOf(context).height;
    final reducedHeight = screenHeight * 0.6;
    const padding = EdgeInsets.symmetric(horizontal: 25, vertical: 25);
    const decoration = BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)));
    return Consumer <CalculatorProvider> (
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text("Calculator App"),
            backgroundColor: Colors.black,
          ),
          body: Column(
            children: [
              CustomTextField(controller: provider.compController,),
              const SizedBox(height: 100), // Add margin here
              Container(
                height: reducedHeight,
                width: double.infinity,
                padding: padding,
                decoration: decoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(4, (index) => buttonList[index])),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(4, (index) => buttonList[index + 4])),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(4, (index) => buttonList[index + 8])),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      3, (index) => buttonList[index + 12])),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      3, (index) => buttonList[index + 15])),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const CalculateButton()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
