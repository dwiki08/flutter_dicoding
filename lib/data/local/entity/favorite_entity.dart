import 'package:floor/floor.dart';

@Entity(tableName: 'restaurant')
class RestaurantEntity {
  @PrimaryKey()
  final String restaurantId;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final double rating;

  RestaurantEntity(
    this.restaurantId,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.rating,
  );
}
