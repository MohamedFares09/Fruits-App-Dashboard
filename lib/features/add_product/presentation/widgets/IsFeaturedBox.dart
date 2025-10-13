
import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/core/utils/app_colors.dart';
import 'package:fruit_app_dashboard/core/utils/app_text_styles.dart';

class IsFeaturedCheckbox extends StatefulWidget {
  const IsFeaturedCheckbox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsFeaturedCheckbox> createState() => _IsFeaturedCheckboxState();
}

class _IsFeaturedCheckboxState extends State<IsFeaturedCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14.0, 0),
      child: Row(
        children: [
          SizedBox(
            // width:
            //     MediaQuery.of(context).size.width -
            //     (kHorizontalPadding * 2) -
            //     50,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Is Featured Item',
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
