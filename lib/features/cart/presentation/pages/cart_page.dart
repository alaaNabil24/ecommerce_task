import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_app_task/features/cart/presentation/cubit/cart_cubit.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../widgets/cart_card.dart';
import '../widgets/checkout_card.dart';
import '../widgets/custom_delete_cart_dialog.dart';
import 'order_management_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(sl())..getCartData(),
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            var cubit = context.read<CartCubit>();
            return cubit.cartItems.isEmpty
                ? const SizedBox()
                : CheckoutCard();
          },
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
                  child: cubit.cartItems.isEmpty
                      ? const Center(child: Text("Cart is empty"))
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: cubit.cartItems.length,
                          itemBuilder: (context, index) => Dismissible(
                              key: Key(cubit.cartItems[index].id.toString()),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                cubit.deleteProductFromCart(index);
                              },
                              background: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE6E6),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    SvgPicture.asset("assets/icon/delete.svg"),
                                  ],
                                ),
                              ),
                              child: CartCard(
                                cart: cubit.cartItems[index],
                                onPress: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          DeleteConfirmationDialog(
                                            onDelete: () {
                                              cubit
                                                  .deleteProductFromCart(index);
                                            },
                                            onCancel: () {},
                                          ));
                                },
                              )),
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
