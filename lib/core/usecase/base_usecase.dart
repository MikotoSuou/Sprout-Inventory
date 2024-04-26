
import 'package:dartz/dartz.dart';
import '../error/failure.dart';

abstract class BaseUseCase<Params, Type> {
  Future<Either<Type, Failure>?> call(Params params);
}