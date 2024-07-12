import 'package:dicoding_flutter/common/extensions.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart' as m_restaurant;
import 'package:dicoding_flutter/data/remote/response/restaurant_response.dart';

extension RestaurantResponseDTO on Restaurant {
  m_restaurant.Restaurant toModel() {
    final foods = this
        .menus
        ?.foods
        ?.map((e) => m_restaurant.Category(name: e.name.orEmpty()));
    final drinks = this
        .menus
        ?.drinks
        ?.map((e) => m_restaurant.Category(name: e.name.orEmpty()));
    final menus = m_restaurant.Menus(
        foods: foods?.toList() ?? [], drinks: drinks?.toList() ?? []);
    final categories = this
        .categories
        ?.map((e) => m_restaurant.Category(name: e.name.orEmpty()));
    final customerReviews = this.customerReviews?.map((e) =>
        m_restaurant.CustomerReview(
            name: e.name.orEmpty(),
            review: e.review.orEmpty(),
            date: e.date.orEmpty()));
    return m_restaurant.Restaurant(
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
