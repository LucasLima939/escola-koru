abstract class NoParameters {}

abstract class UseCase<T, Z> {
  Future<T> call([Z param]);
}
