import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tlb_app/core/error/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
