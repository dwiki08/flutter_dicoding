import 'dart:convert';

import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/components/error_msg.dart';
import 'package:dicoding_flutter/components/tile_restaurant.dart';
import 'package:dicoding_flutter/model/restaurants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString(assetsRaw('local_restaurant.json')),
        builder: (context, snapshot) {
          var restaurants = [];
          try {
            if (snapshot.hasData) {
              restaurants =
                  Restaurants.fromJson(jsonDecode(snapshot.data!)).restaurants;
            }
            return ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      TileRestaurant(restaurant: restaurants[i]),
                      if (i < restaurants.length - 1)
                        const Divider(
                          height: 1,
                          indent: defaultPadding,
                          endIndent: defaultPadding,
                        )
                    ],
                  );
                });
          } on Exception catch (e) {
            return ErrorMsg(exception: e);
          }
        },
      ),
    );
  }
}
