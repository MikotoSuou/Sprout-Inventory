import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/features/product/domain/usecases/get_product_detail_usecase.dart';

import '../../../../fixtures/stub_objects/product_detail.dart';
import '../repository/product_repository_mock.mocks.dart';

void main() {
  late MockIProductRepository repository;
  late GetProductDetailUseCase getProductDetailUseCase;

  setUp(() {
    repository = MockIProductRepository();
    getProductDetailUseCase = GetProductDetailUseCase(repository);
  });

  test('should return product detail from the repository when successful', () async {
    const id = 1;
    const expectedResult = stubProductDetail;
    when(repository.getProductDetail(any))
        .thenAnswer((_) async => const Left(expectedResult));


    final result = await getProductDetailUseCase(id);

    expect(result, const Left(expectedResult));
    verify(repository.getProductDetail(id)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return failure from the repository when failed', () async {
    const id = 1;
    const expectedResult = ServerFailure();
    when(repository.getProductDetail(any))
        .thenAnswer((_) async => const Right(expectedResult));


    final result = await getProductDetailUseCase(id);

    expect(result, const Right(expectedResult));
    verify(repository.getProductDetail(id)).called(1);
    verifyNoMoreInteractions(repository);
  });
}