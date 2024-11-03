import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_task/features/cart/presentation/cubit/cart_cubit.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../widgets/cart_card.dart';
import '../widgets/custom_delete_cart_dialog.dart';
import 'order_management_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CartCubit(sl())
        ..getCartData(),
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              var cubit = context.read<CartCubit>();
              return cubit.cartItems.isEmpty ? const SizedBox() : Row(

                children: [
                  Text(
                    "Total: \$${state is CartLoaded ? cubit.getTotalPrice(cubit.cartItems) : 0}",),

                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OrderManagementPage(),
                        ),
                      );
                    },
                    child: const Text("Checkout"),
                  ),
                ],
              );
            },
          ),
        ),
        appBar: const CustomAppBar(


          title: "Cart",
          isCartPage: true,
        ),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is DeleteFromCartSuccess) {

              context.read<CartCubit>().cartItems.removeAt(int.parse(state.id));

              ToastHelper.showSuccess("Product deleted successfully");
            }
          },
          builder: (context, state) {
            var cubit = context.read<CartCubit>();

            if (state is CartLoading) {
              return const CustomLoading();
            } else if (state is CartLoaded || state is DeleteFromCartSuccess) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: cubit.cartItems.isEmpty ? const Center(child: Text("Cart is empty")) : GridView.builder(
                    itemCount: cubit.cartItems.length,
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) =>
                        CartCard(
                          product: cubit.cartItems[index],
                          onPress: () {
                            showDialog(

                                context: context,
                                builder: (context) =>
                                    DeleteConfirmationDialog(
                                      onDelete: () {
                                        cubit.deleteProductFromCart(
                                            index);
                                      },
                                      onCancel: () {},
                                    ));
                          },
                        ),
                  ),
                ),
              );
            } else if (state is CartError) {
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
