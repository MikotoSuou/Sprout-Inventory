
import 'package:retrofit/retrofit.dart';
import 'package:sprout_inventory/features/product/data/responses/products_response.dart';
import '../../../../../core/data_source/remote/api_service.dart';


abstract class IProductRemoteDataSource {
  Future<HttpResponse<ProductsResponse>> products(String page);
  Future<HttpResponse<dynamic>> productDetail(int productId);
}

class ProductRemoteDataSourceImpl implements IProductRemoteDataSource {
  final ApiService _apiService;

  ProductRemoteDataSourceImpl(this._apiService);

  @override
  Future<HttpResponse<ProductsResponse>> products(String page) async {
    return await _apiService.productsService(page);
  }

  @override
  Future<HttpResponse> productDetail(int productId) async {
    // TODO: implement productDetail
    throw UnimplementedError();
  }
}
