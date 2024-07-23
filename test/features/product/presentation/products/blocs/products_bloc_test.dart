
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/core/error/error_handler.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/features/product/presentation/products/blocs/products_bloc.dart';
import 'package:sprout_inventory/features/product/presentation/products/models/products_state_model.dart';
import '../../../../../fixtures/stub_objects/products.dart';
import '../../../domain/usecases/get_products_usecase_mock.mocks.dart';

void main() {
  late MockGetProductsUseCase getProductsUseCase;
  late ProductsBloc bloc;

  setUp(() {
    getProductsUseCase = MockGetProductsUseCase();
    bloc = ProductsBloc(getProductsUseCase);
  });

  test("initial state should be ProductsLoading", () {
    // assert
    expect(bloc.state, equals(const ProductsLoading()));
  });

  group("GetProducts", () {
    void setUpMockGetProductsSuccess() => when(getProductsUseCase(any))
            .thenAnswer((_) async => const Left(stubProducts));

    // this test should fail i don't know why its passing
    blocTest<ProductsBloc, ProductsState>(
      "should update the state to loaded state",
      setUp: () => setUpMockGetProductsSuccess(),
      build: () => bloc,
      act: (bloc) => bloc.add(const GetProducts()),
      verify: (_) => getProductsUseCase(stubProductsParam),
      expect: () => []
    );

    void setUpMockGetProductsFailed() => when(getProductsUseCase(any))
        .thenAnswer((_) async => const Right(ServerFailure()));

    // this test should fail i don't know why its passing
    blocTest<ProductsBloc, ProductsState>(
      "should update the state to failed state",
      setUp: () => setUpMockGetProductsFailed(),
      build: () => bloc,
      act: (bloc) => bloc.add(const GetProducts()),
      verify: (_) => getProductsUseCase(stubProductsParam),
      expect: () => [ ]
    );
  });

  tearDown(() => bloc.close());

}
