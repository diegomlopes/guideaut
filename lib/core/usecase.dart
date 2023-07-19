import 'package:dartz/dartz.dart';
import 'package:guideaut/core/failures.dart';

abstract class Usecase<OutputType, InputParams> {
  Future<Either<Failure, OutputType>> call(InputParams params);
}
