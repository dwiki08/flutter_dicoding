extension StringExtensions on String? {
  String orEmpty() => this ?? '';
}

extension IntExtensions on int? {
  String httpCodeText() {
    switch (this) {
      case 1:
        return 'Check your internet connection';
      case 404:
        return "We couldn't find what you were looking for";
      default:
        return 'Sorry, we have a problem here';
    }
  }
}
