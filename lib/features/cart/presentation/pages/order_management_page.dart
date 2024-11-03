import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_task/core/widgets/network_image.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../cubit/cart_cubit.dart';
import '../widgets/order_summary_widget.dart';

class OrderManagementPage extends StatelessWidget {
  const OrderManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(sl())..getCartData(),
      child: Scaffold(
        bottomNavigationBar: const OrderSummaryWidget(),
        appBar: const CustomAppBar(
          title: "Checkout Page",
          isCartPage: false,
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
              return cubit.cartItems.isEmpty
                  ? const Center(child: Text("Product list is empty"))
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      itemCount: cubit.cartItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(cubit.cartItems[index].title),
                        leading:  CircleAvatar(
                          backgroundColor:  Colors.transparent,
                          backgroundImage: CachedNetworkImageProvider(

                            cubit.cartItems[index].image
                          ), // Load image from network
                        ),

                        subtitle: Text("\$${cubit.cartItems[index].price}"),
                        trailing: IconButton(
                          onPressed: () {
                            cubit.deleteProductFromCart(
                                cubit.cartItems[index].id);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
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
