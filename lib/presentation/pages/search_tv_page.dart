import 'package:ditonton/common/constants.dart';
import 'package:ditonton/presentation/bloc/tv/search/tv_search_cubit.dart';
import 'package:ditonton/presentation/widgets/filler_view.dart';
import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/searchTv';

  @override
  State<SearchTvPage> createState() => _SearchTvPageState();
}

class _SearchTvPageState extends State<SearchTvPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController
                ..text = context.read<TvSearchCubit>().lastQuery,
              onSubmitted: (query) {
                context.read<TvSearchCubit>().searchData(query);
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
            BlocBuilder<TvSearchCubit, TvSearchState>(
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
                          return TvCard(movie);
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
