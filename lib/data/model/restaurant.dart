class Restaurant {
  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  double rating;
  List<CustomerReview>? customerReviews;
  List<Category>? categories;
  Menus? menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });
}

class Category {
  String name;

  Category({
    required this.name,
  });
}

class CustomerReview {
  String name;
  String review;
  String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });
}

class Menus {
  List<Category> foods;
  List<Category> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });
}
