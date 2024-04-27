


import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sprout_inventory/features/product/data/data_source/products_data_source.dart';
import 'package:sprout_inventory/features/product/data/repository/product_repository_impl.dart';
import 'package:sprout_inventory/features/product/domain/repository/product_repository.dart';
import 'package:sprout_inventory/features/product/domain/usecases/get_product_detail_usecase.dart';
import '../../features/product/domain/usecases/get_products_usecase.dart';
import '../data_source/remote/api_service.dart';
import '../utils/dio_factory.dart';
import '../utils/network_info.dart';


final instance = GetIt.instance;

class AppDependencies {
  static Future<void> get initialize async {
    // network info
    instance.registerLazySingleton<INetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

    // remote data source
    instance.registerLazySingleton<DioFactory>(() => const DioFactory());
    final dio = await instance<DioFactory>().getDio();
    instance.registerLazySingleton<ApiService>(() => ApiService(dio));

    // product data source, repository
    instance.registerLazySingleton<IProductRemoteDataSource>(() => ProductRemoteDataSourceImpl(instance()));
    instance.registerLazySingleton<IProductRepository>(() => ProductRepositoryImpl(instance(), instance()));
  }
}

FutureOr<void> initProductsDependencies() async {
  if(!GetIt.I.isRegistered<GetProductsUseCase>()) {
    instance.registerFactory<GetProductsUseCase>(() => GetProductsUseCase(instance()));
  }
}

FutureOr<void> initProductDetailDependencies() async {
  if(!GetIt.I.isRegistered<GetProductDetailUseCase>()) {
    instance.registerFactory<GetProductDetailUseCase>(() => GetProductDetailUseCase(instance()));
  }
}