import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/features/product/domain/entities/product.dart';
import 'package:sprout_inventory/features/product/domain/entities/products.dart';
import 'package:sprout_inventory/features/product/domain/usecases/get_products_usecase.dart';

import '../repository/product_repository_mock.mocks.dart';

void main() {
  late MockIProductRepository repository;
  late GetProductsUseCase getProductsUseCase;
  late int tParam;
  late Products tProducts;

  setUp(() {
    repository = MockIProductRepository();
    getProductsUseCase = GetProductsUseCase(repository);

    tParam = 1;

    tProducts = const Products(
      products: [
        Product(
          id: 1,
          title: 'test',
          price: '1',
          thumbnail: 'test',
          stock: 1,
          discountPercentage: 1
        ),
      ],
      total: 10,
      page: 10,
      limit: 10
    );
  });

  test('should get list of products based on page number from the repository', () async {
      // arrange
      when(repository.getProducts(any))
          .thenAnswer((_) async => Left(tProducts));

      // act
      final result = await getProductsUseCase(tParam);

      // assert
      expect(result, Left(tProducts));
      verify(repository.getProducts(tParam));
      verifyNoMoreInteractions(repository);
    },
  );
}