

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sprout_inventory/features/product/data/responses/product_detail_response.dart';
import '../../../features/product/data/responses/products_response.dart';
import '../../utils/constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("products?limit=10&skip={page}&select=title,price,thumbnail,stock,discountPercentage")
  Future<HttpResponse<ProductsResponse>> productsService(
    @Path("page") String page,
  );

  @GET("products/{PRODUCT_ID}")
  Future<HttpResponse<ProductDetailResponse>> productDetailService(
    @Path("PRODUCT_ID") String productId,
  );

}