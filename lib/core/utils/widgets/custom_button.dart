import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/core/utils/app_colors.dart';
import 'package:fruit_app_dashboard/core/utils/app_text_styles.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: AppColors.primaryColor),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
