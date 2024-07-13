Map<String, dynamic> generalJson = {
  "error": false,
  "message": "success"
};

Map<String, dynamic> restaurantListJson = {
  "error": false,
  "message": "success",
  "count": 2,
  "restaurants": [
    {
      "id": "rqdv5juczeskfw1e867",
      "name": "Melting Pot",
      "description":
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
      "pictureId": "14",
      "city": "Medan",
      "rating": 4.2
    },
    {
      "id": "s1knt6za9kkfw1e867",
      "name": "Kafe Kita",
      "description":
      "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
      "pictureId": "25",
      "city": "Gorontalo",
      "rating": 4
    }
  ]
};

Map<String, dynamic> restaurantListEmptyJson = {
  "error": false,
  "founded": 0,
  "restaurants": []
};

Map<String, dynamic> restaurantDetailJson = {
  "error": false,
  "message": "success",
  "restaurant": {
    "id": "fnfn8mytkpmkfw1e867",
    "name": "Makan mudah",
    "description": "But I must explain to you how all this mistaken.",
    "city": "Medan",
    "address": "Jln. Pandeglang no 19",
    "pictureId": "22",
    "categories": [
      {"name": "Jawa"}
    ],
    "menus": {
      "foods": [
        {"name": "Kari kacang dan telur"},
        {"name": "Toastie salmon"},
      ],
      "drinks": [
        {"name": "Minuman soda"},
        {"name": "Jus apel"},
      ]
    },
    "rating": 3.7,
    "customerReviews": [
      {
        "name": "Gilang",
        "review": "Harganya murah sekali!",
        "date": "14 Agustus 2018"
      }
    ]
  }
};

Map<String, dynamic> restaurantDetailNotFoundJson = {
  "error": true,
  "message": "Restaurant not found"
};