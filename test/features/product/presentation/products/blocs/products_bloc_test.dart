
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/core/utils/constants.dart';
import 'package:sprout_inventory/features/product/presentation/products/cubit/products_cubit.dart';
import '../../../../../fixtures/stub_objects/products.dart';
import '../../../domain/usecases/get_products_usecase_mock.mocks.dart';

void main() {
  late MockGetProductsUseCase getProductsUseCase;
  late ProductsCubit cubit;

  setUp(() {
    getProductsUseCase = MockGetProductsUseCase();
    cubit = ProductsCubit(getProductsUseCase);
  });

  test("initial status should be ProductsStatus.loading", () {
    // assert
    expect(cubit.state.status, equals(ProductsStatus.loading));
  });

  group("GetProducts", () {
    void setUpMockGetProductsSuccess() => when(getProductsUseCase(any))
            .thenAnswer((_) async => const Left(stubProducts));

    blocTest<ProductsCubit, ProductsState>(
      "should update the state to success state",
      setUp: () => setUpMockGetProductsSuccess(),
      build: () => cubit,
      act: (cubit) => cubit.getProducts(),
      verify: (_) => getProductsUseCase(stubProductsParam),
      expect: () => [
        ProductsState(
          status: ProductsStatus.success,
          products: stubProducts.products,
          page: 2,
          hasReachedMax: false,
          error: Constants.emptyString
        )
      ]
    );

    void setUpMockGetProductsFailed() => when(getProductsUseCase(any))
        .thenAnswer((_) async => const Right(ServerFailure()));

    blocTest<ProductsCubit, ProductsState>(
      "should update the state to empty state",
      setUp: () => setUpMockGetProductsFailed(),
      build: () => cubit,
      act: (cubit) => cubit.getProducts(),
      verify: (_) => getProductsUseCase(stubProductsParam),
      expect: () => [
        const ProductsState(
          status: ProductsStatus.empty,
          products: [],
          page: 0,
          hasReachedMax: false,
          error: Constants.emptyString
        )
      ]
    );
  });

  tearDown(() => cubit.close());

}
