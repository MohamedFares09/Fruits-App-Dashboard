import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/core/utils/app_colors.dart';
import 'package:fruit_app_dashboard/core/utils/app_text_styles.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14.0, 0),
      child: Row(
        children: [
          SizedBox(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Is Organic Item',
                    style: AppTextStyles.semibold13.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox(width: 10)),
          Checkbox(
            focusColor: AppColors.lightPrimaryColor,
            fillColor: WidgetStatePropertyAll(
              isChecked ? AppColors.primaryColor : Colors.transparent,
            ),
            checkColor: Colors.white,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
                widget.onChanged(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
