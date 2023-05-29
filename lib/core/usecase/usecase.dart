abstract class BaseUseCase<Type> {
  const BaseUseCase();
}

abstract class UseCase<Type, Params> extends BaseUseCase<Type> {
  Future<Type> call(Params params);
}

abstract class NoParamsUseCase<Type> extends BaseUseCase<Type> {
  const NoParamsUseCase() : super();

  Future<Type> call();
}
