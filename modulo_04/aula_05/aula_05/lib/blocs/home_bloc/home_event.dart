import 'package:aula_03/entities/home_entities/product_model.dart';

abstract class HomeEvent {}

class FetchProductsCatalog implements HomeEvent {}

class AddProduct implements HomeEvent {
  final ProductModel product;
  const AddProduct(this.product);
}

class RemoveProduct implements HomeEvent {
  final ProductModel product;
  const RemoveProduct(this.product);
}

class FetchCart implements HomeEvent {}
