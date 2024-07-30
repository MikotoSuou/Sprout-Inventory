
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/features/product/presentation/products/blocs/products_bloc.dart';
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
    expect(bloc.state, equals(const ProductsLoading()));
  });

  group("GetProducts", () {
    const page = 1;
    void setUpMockGetProductsSuccess() => when(getProductsUseCase(page))
            .thenAnswer((_) async => const Left(stubProducts));

    blocTest<ProductsBloc, ProductsState>(
      "should update the state to loaded state",
      setUp: () => setUpMockGetProductsSuccess(),
      build: () => ProductsBloc(getProductsUseCase),
      act: (myBloc) => myBloc.add(const GetProducts()),
      verify: (_) => getProductsUseCase(page),
    );

    void setUpMockGetProductsFailed() => when(getProductsUseCase(page))
        .thenAnswer((_) async => const Right(ServerFailure()));

    blocTest<ProductsBloc, ProductsState>(
      "should update the state to failed state",
      setUp: () => setUpMockGetProductsFailed(),
      build: () => bloc,
      act: (bloc) => bloc.add(const GetProducts()),
      verify: (_) => getProductsUseCase(page),
    );
  });

  tearDown(() => bloc.close());

}
