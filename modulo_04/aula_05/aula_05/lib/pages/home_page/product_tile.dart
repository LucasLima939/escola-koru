import 'package:aula_03/blocs/home_bloc/home_bloc.dart';
import 'package:aula_03/blocs/home_bloc/home_event.dart';
import 'package:aula_03/entities/home_entities/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTile extends StatefulWidget {
  final ProductModel product;
  const ProductTile({
    super.key,
    required this.product,
  });

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage(widget.product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const Text('Lorem Ipsum dolor sit amet',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ]),
            ),
          ),
          const Spacer(),
          Container(
            height: 40,
            width: 110,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => context.read<HomeBloc>().add(RemoveProduct(widget.product)),
                    icon: const Icon(Icons.remove, color: Colors.white),
                    iconSize: 15,
                  ),
                  IconButton(
                    onPressed: () => context.read<HomeBloc>().add(AddProduct(widget.product)),
                    icon: const Icon(Icons.add, color: Colors.white),
                    iconSize: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
