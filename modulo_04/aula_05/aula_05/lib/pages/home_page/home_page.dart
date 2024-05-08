import 'package:aula_03/blocs/home_bloc/home_bloc.dart';
import 'package:aula_03/blocs/home_bloc/home_event.dart';
import 'package:aula_03/blocs/home_bloc/home_state.dart';
import 'package:aula_03/entities/home_entities/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_cart_icon.dart';
import 'product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel>? products;

  @override
  void initState() {
    context.read<HomeBloc>().add(FetchProductsCatalog());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Mercadinho Korú',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        actions: const [ProductCartIcon()],
      ),
      body: Column(
        children: [
          BlocBuilder<HomeBloc, HomeBlocState>(
              bloc: context.read<HomeBloc>(),
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                } else if (state is CatalogSuccessState) {
                  products = state.products;
                }

                return products != null ? _buildCatalog(products!) : Container();
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget _buildCatalog(List<ProductModel> products) => Expanded(
      child: RefreshIndicator(
        onRefresh: () async => context.read<HomeBloc>().add(FetchProductsCatalog()),
        child: ListView(
            children: products
                .map((product) => ProductTile(product: product))
                .toList()),
      ));
}
