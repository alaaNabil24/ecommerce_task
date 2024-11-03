import 'package:flutter/material.dart';

import '../../features/cart/presentation/pages/cart_page.dart';
import '../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title,  this.isCartPage = false});

  final String title;

  final bool isCartPage ;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      actions: [

        if(!isCartPage)
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
            icon: const Icon(
              Icons.shopping_cart_sharp,
              color: Colors.white,
              size: 30,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
