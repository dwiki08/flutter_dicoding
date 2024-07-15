const String appName = 'Your Story';

enum ImageRes {
  small('small'),
  medium('medium'),
  large('large');

  final String value;

  const ImageRes(this.value);
}

String networkImageUrl(String imageId, ImageRes imageRes) =>
    'https://restaurant-api.dicoding.dev/images/${imageRes.value}/$imageId';

String assetsFonts(String name) => 'assets/fonts/$name';

String assetsRaw(String name) => 'assets/raw/$name';

String assetsIcons(String name) => 'assets/icons/$name';
