import 'package:aula_03/entities/home_entities/product_model.dart';

abstract class HomeBlocState {}

class InitialState implements HomeBlocState {}

class LoadingState implements HomeBlocState {}

class CatalogSuccessState implements HomeBlocState {
  final List<ProductModel> products;
  const CatalogSuccessState(this.products);
}
class CartSuccessState implements HomeBlocState {
  final List<ProductModel> products;
  const CartSuccessState(this.products);
}

class FailureState implements HomeBlocState {}