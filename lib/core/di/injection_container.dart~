import 'package:get_it/get_it.dart';
import 'package:market_app_task/core/helpers/dio_helper.dart';
import 'package:market_app_task/features/cart/data/repositories/cart_repository_imp.dart';
import 'package:market_app_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:market_app_task/features/products/data/repositories/products_repository_api_imp.dart';
import 'package:market_app_task/features/products/domain/entities/product_data.dart';
import 'package:market_app_task/features/products/domain/repositories/products_repository_api.dart';
import 'package:market_app_task/features/products/domain/repositories/products_repository_local.dart';

import '../../features/cart/domain/usecases/cart_use_case.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/products/data/repositories/products_repository_local_imp.dart';
import '../../features/products/domain/usecases/products_use_case.dart';
import '../../features/products/presentation/cubit/products_cubit.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<DioHelper>(DioHelper());

  sl.registerFactory<ProductsRepositoryApi>(() => ProductsRepositoryApiImpl());
  sl.registerFactory<ProductsRepositoryLocal>(() => ProductsRepositoryLocalImpl());
  sl.registerFactory<CartRepository>(() => CartRepositoryImp());
  sl.registerSingleton<CartUseCase>(CartUseCase(sl()));
  sl.registerSingleton<CartCubit>(CartCubit(sl()));

  sl.registerSingleton<ProductsUseCase>(ProductsUseCase(sl(), sl()));
  sl.registerSingleton<ProductsCubit>(ProductsCubit(sl()));



}
