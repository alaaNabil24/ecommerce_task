import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:market_app_task/core/theme/app_colors.dart';
import 'package:market_app_task/features/cart/domain/entities/cart_data.dart';

import 'core/di/injection_container.dart';
import 'core/helpers/dio_helper.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/products/domain/entities/product_data.dart';
import 'features/products/presentation/pages/products_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await initializeDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CartItemAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: false,
      ),
      home: SignInPage(),
    );
  }
}
