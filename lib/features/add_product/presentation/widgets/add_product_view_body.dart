import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruit_app_dashboard/features/add_product/presentation/widgets/image_filed.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  // Save product name
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  // Save product price
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'product code',
                keyboardType: TextInputType.number,
              ),
              // Save product code,
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Description',
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  // Save product description
                },
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (value) {
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
