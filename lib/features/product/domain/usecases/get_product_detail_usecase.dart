
import 'package:dartz/dartz.dart';
import 'package:sprout_inventory/features/product/domain/entities/product_detail.dart';
import 'package:sprout_inventory/features/product/domain/repository/product_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';

class GetProductDetailUseCase implements BaseUseCase<int, ProductDetail> {
  final IProductRepository _productRepository;
  GetProductDetailUseCase(this._productRepository);

  @override
  Future<Either<ProductDetail, Failure>> call(int productId) async {
    return await _productRepository.getProductDetail(productId);
  }
}