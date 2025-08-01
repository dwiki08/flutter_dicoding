// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeApp => 'Welcome to Your Story app';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'youremail@mail.com';

  @override
  String get password => 'Password';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get haveAnAccount => 'Have an account? ';

  @override
  String get register => 'Register';

  @override
  String get createNewAccount => 'Create new account';

  @override
  String get name => 'Name';

  @override
  String get authNotMatch =>
      'Your email or password doesn\'t match. Please try again.';

  @override
  String get registerFailed => 'Failed to create an account. Please try again.';

  @override
  String get registerSuccess => 'Success to create an account.';

  @override
  String get cancel => 'Cancel';

  @override
  String get yes => 'Yes';

  @override
  String get logout => 'Logout';

  @override
  String get logoutDialog => 'Are your sure want to logout?';

  @override
  String get addStory => 'Add story';

  @override
  String get gallery => 'Gallery';

  @override
  String get camera => 'Camera';

  @override
  String get writeStoryHint => 'Write your story here...';

  @override
  String get send => 'Send';

  @override
  String get dialogFillStory =>
      'Please pick an image and write your story first.';

  @override
  String get loading => 'Loading';

  @override
  String get location => 'Location';

  @override
  String get chooseLocation => 'Choose location point';

  @override
  String get choose => 'Choose';
}
