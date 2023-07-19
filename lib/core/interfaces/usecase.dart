import 'package:dartz/dartz.dart';

import 'failure.dart';

abstract interface class UseCase<T, P> {
  Either<Failure, T> call({required P params});
}

abstract interface class NoParamsUseCase<T> {
  Either<Failure, T> call();
}

abstract interface class NoReturnUseCase<P> {
  Either<Failure, Unit> call({required P params});
}

abstract interface class NoParamsNoReturnUseCase {
  Either<Failure, Unit> call();
}

abstract interface class FutureUseCase<T, P> {
  Future<Either<Failure, T>> call({required P params});
}

abstract interface class NoParamsFutureUseCase<T> {
  Future<Either<Failure, T>> call();
}

abstract interface class NoReturnFutureUseCase<P> {
  Future<Either<Failure, Unit>> call({required P params});
}

abstract interface class NoParamsNoReturnFutureUseCase {
  Future<Either<Failure, Unit>> call();
}

abstract interface class StreamUseCase<T, P> {
  Stream<Either<Failure, T>> call({required P params});
}

abstract interface class NoParamsStreamUseCase<T> {
  Stream<Either<Failure, T>> call();
}

abstract interface class NoReturnStreamUseCase<P> {
  Stream<Either<Failure, Unit>> call({required P params});
}

abstract interface class NoParamsNoReturnStreamUseCase {
  Stream<Either<Failure, Unit>> call();
}
