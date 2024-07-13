import 'package:dicoding_flutter/common/extensions.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';

import '../remote/response/restaurant_response.dart';

extension RestaurantResponseDTO on RestaurantResponse {
  Restaurant toModel() {
    final foods =
        this.menus?.foods?.map((e) => Category(name: e.name.orEmpty()));
    final drinks =
        this.menus?.drinks?.map((e) => Category(name: e.name.orEmpty()));
    final menus =
        Menus(foods: foods?.toList() ?? [], drinks: drinks?.toList() ?? []);
    final categories =
        this.categories?.map((e) => Category(name: e.name.orEmpty()));
    final customerReviews = this.customerReviews?.map((e) => CustomerReview(
        name: e.name.orEmpty(),
        review: e.review.orEmpty(),
        date: e.date.orEmpty()));
    return Restaurant(
      id: id.orEmpty(),
      name: name.orEmpty(),
      description: description.orEmpty(),
      pictureId: pictureId.orEmpty(),
      city: city.orEmpty(),
      rating: rating ?? 0.0,
      menus: menus,
      address: address.orEmpty(),
      categories: categories?.toList(),
      customerReviews: customerReviews?.toList(),
    );
  }
}
