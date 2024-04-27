
import 'package:retrofit/retrofit.dart';
import 'package:sprout_inventory/features/product/data/responses/product_detail_response.dart';
import 'package:sprout_inventory/features/product/data/responses/products_response.dart';
import '../../../../../core/data_source/remote/api_service.dart';


abstract class IProductRemoteDataSource {
  Future<HttpResponse<ProductsResponse>> products(String page);
  Future<HttpResponse<ProductDetailResponse>> productDetail(String productId);
}

class ProductRemoteDataSourceImpl implements IProductRemoteDataSource {
  final ApiService _apiService;

  ProductRemoteDataSourceImpl(this._apiService);

  @override
  Future<HttpResponse<ProductsResponse>> products(String page) async {
    return await _apiService.productsService(page);
  }

  @override
  Future<HttpResponse<ProductDetailResponse>> productDetail(String productId) async {
    return await _apiService.productDetailService(productId);
  }
}
