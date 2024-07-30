import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/features/product/domain/entities/product.dart';
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

  test('should return list of products on successful getProducts', () async {
      const page = 1;
      const expectedResult = stubProducts;
      when(repository.getProducts(any))
          .thenAnswer((_) async => const Left(expectedResult));

      final result = await getProductsUseCase(page);

      expect(result, const Left(expectedResult));
      verify(repository.getProducts(page));
      verifyNoMoreInteractions(repository);
    },
  );

  test('should return failure on failed getProducts', () async {
    const page = 1;
    const expectedResult = ServerFailure();
    when(repository.getProducts(any))
        .thenAnswer((_) async => const Right(expectedResult));

    final result = await getProductsUseCase(page);

    expect(result, const Right(expectedResult));
    verify(repository.getProducts(page));
    verifyNoMoreInteractions(repository);
  },
  );
}