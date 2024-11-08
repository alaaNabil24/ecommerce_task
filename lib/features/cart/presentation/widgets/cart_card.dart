import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_app_task/core/theme/app_colors.dart';

import '../../../products/domain/entities/product_data.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.cart,
    required this.onPress,
  });

  final Product cart;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,


            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(cart.image , fit: BoxFit.contain,
             height: 80,
             width: 80,
             ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.title??"",
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: "\$${cart.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                  children: [
                    TextSpan(
                        text: " x${1}",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
