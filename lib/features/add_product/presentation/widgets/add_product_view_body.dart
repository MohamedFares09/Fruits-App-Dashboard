import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/utils/widgets/custom_button.dart';
import 'package:fruit_app_dashboard/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruit_app_dashboard/features/add_product/doman/entities/add_product_entity.dart';
import 'package:fruit_app_dashboard/features/add_product/presentation/manager/add_product/add_product_cubit.dart';
import 'package:fruit_app_dashboard/features/add_product/presentation/widgets/image_filed.dart';
import 'package:fruit_app_dashboard/features/add_product/presentation/widgets/IsFeaturedBox.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  late String name, description, code;
  late double price;
  File? image;
  bool isFeatured = false;
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
                  name = value!;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  price = double.parse(value!);
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'product code',
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
              ),
              // Save product code,
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Description',
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  description = value!;
                },
              ),
              SizedBox(height: 16),
              IsFeaturedCheckbox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (value) {
                  setState(() {
                    image = value;
                  });
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                text: 'Add Product',
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      AddProductEntity input = AddProductEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                      );
                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showErrorBar(context, 'Please select an image');
                  }
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  dynamic showErrorBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
