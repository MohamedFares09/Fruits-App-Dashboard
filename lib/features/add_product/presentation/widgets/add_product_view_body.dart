import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/helper_function/build_snak_bar.dart';
import 'package:fruit_app_dashboard/core/utils/widgets/custom_button.dart';
import 'package:fruit_app_dashboard/core/utils/widgets/custom_progress_hud.dart';
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
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildsnakbar(
            context,
            'Product added successfully',
            Colors.green,
          );
        }

        if (state is AddProductFailure) {
          buildsnakbar(
            context,
            state.errorMessage,
            Colors.red,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is AddProductLoading,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    CustomTextFormField(
                      hintText: 'Product Name',
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        name = value!;
                      },
                    ),

                    const SizedBox(height: 16),

                    CustomTextFormField(
                      hintText: 'Product Price',
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        price = double.parse(value!);
                      },
                    ),

                    const SizedBox(height: 16),

                    CustomTextFormField(
                      hintText: 'Product Code',
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        code = value!.toLowerCase();
                      },
                    ),

                    const SizedBox(height: 16),

                    CustomTextFormField(
                      hintText: 'Product Description',
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      onSaved: (value) {
                        description = value!;
                      },
                    ),

                    const SizedBox(height: 16),

                    IsFeaturedCheckbox(
                      onChanged: (value) {
                        isFeatured = value;
                      },
                    ),

                    const SizedBox(height: 16),

                    ImageField(
                      onFileChanged: (value) {
                        setState(() {
                          image = value;
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    CustomButton(
                      text: 'Add Product',
                      onPressed: () {
                        if (image != null) {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            final input = AddProductEntity(
                              name: name,
                              code: code,
                              description: description,
                              price: price,
                              image: image!,
                              isFeatured: isFeatured,
                            );

                            context
                                .read<AddProductCubit>()
                                .addProduct(input);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        } else {
                          _showErrorBar(
                            context,
                            'Please select an image',
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showErrorBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
