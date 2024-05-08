import 'dart:async';

import 'package:aula_03/app_images.dart';
import 'package:aula_03/entities/home_entities/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

final productsCatalog = [
  ProductModel(image: AppImages.laranja, name: 'Laranja'),
  ProductModel(image: AppImages.maca, name: 'Maçã'),
  ProductModel(image: AppImages.pera, name: 'Pera'),
  ProductModel(image: AppImages.banana, name: 'Banana'),
];

class HomeBloc extends Bloc<HomeEvent, HomeBlocState> {
  HomeBloc() : super(InitialState()) {
    on<FetchProductsCatalog>(_onFetchProductsCatalog);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
    on<FetchCart>(_onFetchCart);
  }

  List<ProductModel> productsCart = <ProductModel>[];

  FutureOr<void> _onFetchProductsCatalog(
      FetchProductsCatalog event, Emitter<HomeBlocState> emit) async {
    emit(LoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(CatalogSuccessState(productsCatalog));
  }

  FutureOr<void> _onAddProduct(AddProduct event, Emitter<HomeBlocState> emit) {
    productsCart.add(event.product);
    emit(CartSuccessState(List<ProductModel>.from(productsCart))); // Instância nova lista p atualização
  }

  FutureOr<void> _onRemoveProduct(
      RemoveProduct event, Emitter<HomeBlocState> emit) {
    productsCart.remove(event.product);
    emit(CartSuccessState(List<ProductModel>.from(productsCart)));
  }

  FutureOr<void> _onFetchCart(
      FetchCart event, Emitter<HomeBlocState> emit) async {
    emit(LoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(CartSuccessState(productsCart));
  }
}
