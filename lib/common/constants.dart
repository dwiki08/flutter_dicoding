const String appName = 'Your Foods';

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

enum MyWorkmanager {
  oneOff("one_off_task_id_1", "one_off_task_name"),
  periodic("periodic_task_id_1", "periodic_task_name");

  final String uniqueName;
  final String taskName;

  const MyWorkmanager(this.uniqueName, this.taskName);
}
