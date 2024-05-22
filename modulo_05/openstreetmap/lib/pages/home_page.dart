import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openstreetmap/blocs/home_bloc.dart';

import '../blocs/home_event.dart';
import '../blocs/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.bloc});
  final HomeBloc bloc;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.bloc.add(GetLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Buscador de Endereços'),
      ),
      body: BlocListener(
        bloc: widget.bloc,
        listener: (context, state) {
          if (state is HomeLocationSuccessState) {
            widget.bloc.add(GetAddress(state.location.latitude, state.location.longitude));
          }
        },
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            bloc: widget.bloc,
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is HomeAddressSuccessState) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(state.address),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
