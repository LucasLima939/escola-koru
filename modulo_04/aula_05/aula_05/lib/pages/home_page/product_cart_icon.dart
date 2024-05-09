import 'package:aula_03/app_routes.dart';
import 'package:aula_03/blocs/home_bloc/home_bloc.dart';
import 'package:aula_03/blocs/home_bloc/home_state.dart';
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
    return MultiBlocListener(
      listeners: [
        BlocListener(
          listener: (context, state) {},
          bloc: bloc,
        )
      ],
      child: BlocBuilder<HomeBloc, HomeBlocState>(
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
                          Navigator.pushNamed(context, AppRoutes.cartPage),
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
