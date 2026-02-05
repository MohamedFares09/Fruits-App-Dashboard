import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:fruit_app_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_app_dashboard/core/services/get_it.dart';
import 'package:fruit_app_dashboard/features/add_product/presentation/manager/add_product/add_product_cubit.dart';
import 'package:fruit_app_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'addProductView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: BlocProvider(
        create: (context) =>
            AddProductCubit(getit.get<ImageRepo>(), getit.get<ProductRepo>()),
        child: AddProductViewBody(),
      ),
    );
  }
}
