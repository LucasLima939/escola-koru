import 'package:aula_03/blocs/home_bloc/home_bloc.dart';
import 'package:aula_03/blocs/home_bloc/home_event.dart';
import 'package:aula_03/blocs/home_bloc/home_state.dart';
import 'package:aula_03/entities/home_entities/product_model.dart';
import 'package:aula_03/pages/home_page/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ProductModel> cartProducts = <ProductModel>[];

  @override
  void initState() {
    context.read<HomeBloc>().add(FetchCart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
      ),
      body: BlocBuilder<HomeBloc, HomeBlocState>(
          bloc: context.read<HomeBloc>(),
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartSuccessState) {
              cartProducts = state.products;
            }

            return cartProducts.isNotEmpty
                ? _buildCatalog(cartProducts)
                : const Center(
                    child: Text('Sem produtos no carrinho.',
                        style: TextStyle(color: Colors.black)));
          }),
    );
  }

  Widget _buildCatalog(List<ProductModel> products) => ListView(
      children:
          products.map((product) => ProductTile(product: product)).toList());
}
