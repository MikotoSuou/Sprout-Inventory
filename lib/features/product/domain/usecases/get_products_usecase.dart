
import 'package:dartz/dartz.dart';
import 'package:sprout_inventory/features/product/domain/entities/products.dart';
import 'package:sprout_inventory/features/product/domain/repository/product_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';

class GetProductsUseCase implements BaseUseCase<int, Products> {
  final IProductRepository _productRepository;
  GetProductsUseCase(this._productRepository);

  @override
  Future<Either<Products, Failure>> call(int page) async {
    return await _productRepository.getProducts(page);
  }
}