import 'package:aula_03/blocs/home_bloc/home_bloc.dart';
import 'package:aula_03/blocs/home_bloc/home_state.dart';
import 'package:aula_03/pages/cart_page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCartIcon extends StatefulWidget {
  const ProductCartIcon({super.key});

  @override
  State<ProductCartIcon> createState() => _ProductCartIconState();
}

class _ProductCartIconState extends State<ProductCartIcon> {
  late HomeBloc bloc = context.read<HomeBloc>();
  int cartLength = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeBlocState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is CartSuccessState) {
          cartLength = state.products.length;
        }
        return Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.only(right: 20),
          child: Center(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) => BlocProvider.value(
                              value: bloc, child: const CartPage()),
                        )),
                    icon: const Icon(
                      Icons.shopping_basket_outlined,
                      color: Colors.white,
                      size: 30,
                    )),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('$cartLength',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
