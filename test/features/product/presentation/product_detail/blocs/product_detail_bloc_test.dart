
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/core/error/error_handler.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/cubit/product_detail_cubit.dart';
import '../../../../../fixtures/stub_objects/product_detail.dart';
import '../../../domain/usecases/get_product_detail_usecase_mock.mocks.dart';

void main() {
  late MockGetProductDetailUseCase getProductDetailUseCase;
  late ProductDetailCubit cubit;

  setUp(() {
    getProductDetailUseCase = MockGetProductDetailUseCase();
    cubit = ProductDetailCubit(getProductDetailUseCase);
  });

  test("initial state should be ProductDetailState.loading", () {
    // assert
    expect(cubit.state, equals(const ProductDetailState.loading()));
  });

  group("GetProductDetail", () {
    void setUpMockGetProductDetailSuccess() => when(getProductDetailUseCase(any))
            .thenAnswer((_) async => const Left(stubProductDetail));
    
    blocTest<ProductDetailCubit, ProductDetailState>(
      "should update the state to loaded state",
      setUp: () => setUpMockGetProductDetailSuccess(),
      build: () => cubit,
      act: (cubit) => cubit.getProductDetail(productId: stubProductDetailParam),
      verify: (_) => getProductDetailUseCase(stubProductDetailParam),
      expect: () => [ const ProductDetailState.loaded(stubProductDetail) ]
    );

    void setUpMockGetProductDetailFailed() => when(getProductDetailUseCase(any))
        .thenAnswer((_) async => const Right(ServerFailure()));

    blocTest<ProductDetailCubit, ProductDetailState>(
      "should update the state to failed state",
      setUp: () => setUpMockGetProductDetailFailed(),
      build: () => cubit,
      act: (cubit) => cubit.getProductDetail(productId: stubProductDetailParam),
      verify: (_) => getProductDetailUseCase(stubProductDetailParam),
      expect: () => [ const ProductDetailState.failed(ResponseMessage.serverError) ]
    );
  });

  tearDown(() => cubit.close());

}
