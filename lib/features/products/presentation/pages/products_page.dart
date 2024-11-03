import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_task/core/helpers/toast_helper.dart';
import 'package:market_app_task/core/widgets/custom_app_bar.dart';

import '../../../../core/di/injection_container.dart';

import '../../../../core/widgets/custom_loading.dart';
import '../cubit/products_cubit.dart';
import '../widgets/product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(sl())..getProducts(),
      child: Scaffold(
        appBar: const CustomAppBar(title: "Products"),
        body: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            if (state is AddToCartSuccess) {
              ToastHelper.showSuccess(state.message);
            } else if (state is AddToCartError) {
              ToastHelper.showError(state.message);
            }
          },
          builder: (context, state) {
            var cubit = context.read<ProductsCubit>();

            if (state is ProductsLoading) {
              return const CustomLoading();
            } else if (state is ProductsLoaded ||
                state is AddToCartLoading ||
                state is AddToCartError ||
                state is AddToCartSuccess) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    itemCount: cubit.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) => ProductCard(
                      product: cubit.products[index],
                      onPress: () {
                        cubit.addProductToCart(
                            id: cubit.products[index].id,
                            name: cubit.products[index].title ??"",
                            price: cubit.products[index].price,
                            image: cubit.products[index].image);
                      },
                    ),
                  ),
                ),
              );
            } else if (state is ProductsError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
