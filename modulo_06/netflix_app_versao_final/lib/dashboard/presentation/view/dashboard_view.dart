import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/dashboard/data/entities/movie_entity.dart';
import 'package:netflix_app/dashboard/presentation/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:netflix_app/dashboard/presentation/blocs/dashboard_bloc/dashboard_event.dart';
import 'package:netflix_app/dashboard/presentation/blocs/dashboard_bloc/dashboard_state.dart';
import 'package:netflix_app/login/presentation/utils/app_colors.dart';

class DashboardView extends StatefulWidget {
  final DashboardBloc bloc;
  const DashboardView({super.key, required this.bloc});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    widget.bloc.add(FetchMovies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/home-cover.png'))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: _buildDashboardMainButtons()),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Filmes',
                    style: TextStyle(
                        fontSize: 14, color: AppColors.textGreySecondary),
                  ),
                ),
                const SizedBox(height: 16),
                _buildMoviesRow(),
                const SizedBox(height: 100),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMoviesRow() => BlocBuilder(
      bloc: widget.bloc,
      builder: (context, state) {
        List<MovieEntity> movies = <MovieEntity>[];
        bool isLoading = false;

        if (state is DashboardSuccessState) {
          movies = state.movies;
        } else if (state is DashboardLoadingState) {
          isLoading = true;
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) =>
                _buildPoster(movies.elementAtOrNull(index)?.posterPath),
          ),
        );
      });

  Widget _buildPoster(String? posterPath) => Container(
        margin: const EdgeInsets.only(left: 20),
        height: 200,
        width: 128,
        decoration: BoxDecoration(
          image: posterPath != null
              ? DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/$posterPath'),
                  fit: BoxFit.cover)
              : null,
        ),
      );

  Widget _buildDashboardMainButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(Icons.check),
              SizedBox(height: 5),
              Text(
                'Minha Lista',
                style: TextStyle(
                    fontSize: 12,
                    color:
                        AppColors.textGreySecondary), //TODO: CREATE TEXT STYLES
              ),
            ],
          ),
          Container(
            height: 48,
            width: 118,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.redPrimary),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_arrow, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    'PLAY',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Icon(Icons.info_outline),
              SizedBox(height: 5),
              Text(
                'Informações',
                style:
                    TextStyle(fontSize: 12, color: AppColors.textGreySecondary),
              )
            ],
          ),
        ],
      );
}
