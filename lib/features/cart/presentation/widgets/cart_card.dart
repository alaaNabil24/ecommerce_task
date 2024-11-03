import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_app_task/core/theme/app_colors.dart';

import '../../../products/domain/entities/product_data.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.product,
    required this.onPress,
  });

  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.02,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF979797).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(product.image),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.title,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: onPress,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF979797).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.delete_forever_outlined,
                      color: AppColors.primaryColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
