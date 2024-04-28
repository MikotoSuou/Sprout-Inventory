
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/blocs/product_detail_bloc.dart';
import 'package:sprout_inventory/features/product/presentation/products/blocs/products_bloc.dart';
import 'package:sprout_inventory/features/product/presentation/products/models/products_state_model.dart';
import '../../../../../fixtures/stub_objects/product_detail.dart';
import '../../../../../fixtures/stub_objects/products.dart';
import '../../../domain/usecases/get_product_detail_usecase_mock.mocks.dart';
import '../../../domain/usecases/get_products_usecase_mock.mocks.dart';

void main() {
  late MockGetProductDetailUseCase getProductDetailUseCase;
  late ProductDetailBloc productDetailBloc;

  setUp(() {
    getProductDetailUseCase = MockGetProductDetailUseCase();
    productDetailBloc = ProductDetailBloc(getProductDetailUseCase);
  });

  test("initial state should be ProductDetailInitial", () {
    // assert
    expect(productDetailBloc.state, equals(const ProductDetailInitial()));
  });

  group("GetProductDetail", () {

    void setUpMockGetProductDetail() => when(getProductDetailUseCase(any))
            .thenAnswer((_) async => const Left(stubProductDetail));
    
    blocTest<ProductDetailBloc, ProductDetailState>(
      "should get data from GetProductDetailUseCase",
      setUp: () => setUpMockGetProductDetail(),
      build: () => productDetailBloc,
      act: (bloc) => bloc.add(const GetProductDetail(productId: stubProductDetailParam)),
      verify: (_) => getProductDetailUseCase(stubProductDetailParam),
    );
  });

  tearDown(() => productDetailBloc.close());

}
