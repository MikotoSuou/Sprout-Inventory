
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/features/product/presentation/products/blocs/products_bloc.dart';
import 'package:sprout_inventory/features/product/presentation/products/models/products_state_model.dart';
import '../../../../../fixtures/stub_objects/products.dart';
import '../../../domain/usecases/get_products_usecase_mock.mocks.dart';

void main() {
  late MockGetProductsUseCase getProductsUseCase;
  late ProductsBloc productsBloc;

  setUp(() {
    getProductsUseCase = MockGetProductsUseCase();
    productsBloc = ProductsBloc(getProductsUseCase);
  });

  test("initial state should be ProductsLoading", () {
    // assert
    expect(productsBloc.state, equals(const ProductsLoading()));
  });

  group("GetProducts", () {

    void setUpMockGetProducts() => when(getProductsUseCase(any))
            .thenAnswer((_) async => const Left(stubProducts));

    blocTest<ProductsBloc, ProductsState>(
      "should get data from GetProductsUseCase",
      setUp: () => setUpMockGetProducts(),
      build: () => productsBloc,
      act: (bloc) => bloc.add(const GetProducts()),
      verify: (_) => getProductsUseCase(stubProductsParam),
    );
  });

  tearDown(() => productsBloc.close());

}
