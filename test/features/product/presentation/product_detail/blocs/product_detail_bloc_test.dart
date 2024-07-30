
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/core/error/error_handler.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/blocs/product_detail_bloc.dart';
import '../../../../../fixtures/stub_objects/product_detail.dart';
import '../../../domain/usecases/get_product_detail_usecase_mock.mocks.dart';

void main() {
  late MockGetProductDetailUseCase getProductDetailUseCase;
  late ProductDetailBloc productDetailBloc;

  setUp(() {
    getProductDetailUseCase = MockGetProductDetailUseCase();
    productDetailBloc = ProductDetailBloc(getProductDetailUseCase);
  });

  test("initial state should be ProductDetailInitial", () {
    expect(productDetailBloc.state, equals(const ProductDetailInitial()));
  });

  group("GetProductDetail", () {
    const id = 1;
    void setUpMockGetProductDetailSuccess() => when(getProductDetailUseCase(id))
            .thenAnswer((_) async => const Left(stubProductDetail));
    
    blocTest<ProductDetailBloc, ProductDetailState>(
      "should update the state to loaded state",
      setUp: () => setUpMockGetProductDetailSuccess(),
      build: () => productDetailBloc,
      act: (bloc) => bloc.add(const GetProductDetail(productId: id)),
      verify: (_) => getProductDetailUseCase(id),
      expect: () => [
        const ProductDetailLoading(),
        const ProductDetailLoaded(productDetail: stubProductDetail)
      ]
    );

    void setUpMockGetProductDetailFailed() => when(getProductDetailUseCase(id))
        .thenAnswer((_) async => const Right(ServerFailure()));

    blocTest<ProductDetailBloc, ProductDetailState>(
        "should update the state to failed state",
        setUp: () => setUpMockGetProductDetailFailed(),
        build: () => productDetailBloc,
        act: (bloc) => bloc.add(const GetProductDetail(productId: id)),
        verify: (_) => getProductDetailUseCase(id),
        expect: () => [
          const ProductDetailLoading(),
          const ProductDetailLoadFailed(error: ResponseMessage.serverError)
        ]
    );
  });

  tearDown(() => productDetailBloc.close());

}
