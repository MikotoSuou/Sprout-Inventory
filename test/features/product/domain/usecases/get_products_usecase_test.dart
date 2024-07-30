import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/features/product/domain/usecases/get_products_usecase.dart';

import '../../../../fixtures/stub_objects/products.dart';
import '../repository/product_repository_mock.mocks.dart';

void main() {
  late MockIProductRepository repository;
  late GetProductsUseCase getProductsUseCase;

  setUp(() {
    repository = MockIProductRepository();
    getProductsUseCase = GetProductsUseCase(repository);
  });

  test('should return products from the repository when successful', () async {
    const id = 1;
    const expectedResult = stubProducts;
    when(repository.getProducts(any))
        .thenAnswer((_) async => const Left(expectedResult));


    final result = await getProductsUseCase(id);

    expect(result, const Left(expectedResult));
    verify(repository.getProducts(id)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return failure from the repository when failed', () async {
    const id = 1;
    const expectedResult = ServerFailure();
    when(repository.getProducts(any))
        .thenAnswer((_) async => const Right(expectedResult));


    final result = await getProductsUseCase(id);

    expect(result, const Right(expectedResult));
    verify(repository.getProducts(id)).called(1);
    verifyNoMoreInteractions(repository);
  });
}