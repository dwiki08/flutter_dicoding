import 'package:dicoding_flutter/data/local/entity/favorite_entity.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';

extension RestaurantEntityDTO on RestaurantEntity {
  Restaurant toModel() {
    return Restaurant(
        id: restaurantId,
        name: name,
        description: description,
        city: city,
        address: address,
        pictureId: pictureId,
        rating: rating);
  }
}

extension RestaurantToEntity on Restaurant {
  RestaurantEntity toEntity() {
    return RestaurantEntity(
      id,
      name,
      description,
      city,
      address,
      pictureId,
      rating,
    );
  }
}
