import 'package:ditonton/common/constants.dart';
import 'package:ditonton/presentation/bloc/movie/search/movie_search_cubit.dart';
import 'package:ditonton/presentation/widgets/filler_view.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMoviePage extends StatefulWidget {
  static const ROUTE_NAME = '/searchMovie';

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController
                ..text = context.read<MovieSearchCubit>().lastQuery ?? '',
              onSubmitted: (query) {
                context.read<MovieSearchCubit>().searchData(query);
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<MovieSearchCubit, MovieSearchState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  error: (msg) {
                    return Center(
                      key: Key('error_message'),
                      child: Text(msg),
                    );
                  },
                  data: (data) {
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          final movie = data[index];
                          return MovieCard(movie);
                        },
                        itemCount: data.length,
                      ),
                    );
                  },
                  initial: () {
                    return FillerView();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
