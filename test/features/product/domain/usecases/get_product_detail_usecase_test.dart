import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/features/product/domain/entities/product_detail.dart';
import 'package:sprout_inventory/features/product/domain/usecases/get_product_detail_usecase.dart';

import '../repository/product_repository_mock.mocks.dart';

void main() {
  late MockIProductRepository repository;
  late GetProductDetailUseCase getProductDetailUseCase;
  late int tParam;
  late ProductDetail tProductDetail;

  setUp(() {
    repository = MockIProductRepository();
    getProductDetailUseCase = GetProductDetailUseCase(repository);

    tParam = 1;

    tProductDetail = const ProductDetail(
      id: 1,
      title: 'test',
      description: 'test',
      originalPrice: '1',
      discountedPrice: '1',
      discountPercentage: 1,
      rating: 1,
      stock: 1,
      brand: 'test',
      category: 'test',
      thumbnail: 'test',
      images: ['test']
    );
  });

  test('should get product detail based on product id from the repository', () async {
      // arrange
      when(repository.getProductDetail(any))
          .thenAnswer((_) async => Left(tProductDetail));

      // act
      final result = await getProductDetailUseCase(tParam);

      // assert
      expect(result, Left(tProductDetail));
      verify(repository.getProductDetail(tParam));
      verifyNoMoreInteractions(repository);
    },
  );
}