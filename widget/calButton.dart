import 'package:calculator_app/Constants/colors.dart';
import 'package:calculator_app/Provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<CalculatorProvider>(context, listen: false)
          .setValue("="),
      child: Container(
        height: 170,
        width: 70,
        decoration: BoxDecoration(color: AppColors.secondaryColor, borderRadius:  BorderRadius.circular(40)),
        child: const Center(child: Text("=", style: TextStyle(fontSize: 32),)),
      ),
    );
  }
}
