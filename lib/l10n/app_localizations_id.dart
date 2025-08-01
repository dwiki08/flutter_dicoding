// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get welcomeApp => 'Selamat datang di Your App';

  @override
  String get login => 'Masuk';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'emailanda@mail.com';

  @override
  String get password => 'Kata sandi';

  @override
  String get dontHaveAccount => 'Belum punya akun? ';

  @override
  String get haveAnAccount => 'Sudah punya akun? ';

  @override
  String get register => 'Daftar';

  @override
  String get createNewAccount => 'Buat akun baru';

  @override
  String get name => 'Nama';

  @override
  String get authNotMatch =>
      'Email atau kata sandi Anda tidak sesuai. Silahkan coba lagi.';

  @override
  String get registerFailed =>
      'Gagal melakukan pembuatan akun. Silahkan coba lagi.';

  @override
  String get registerSuccess => 'Berhasil membuat akun.';

  @override
  String get cancel => 'Batal';

  @override
  String get yes => 'Ya';

  @override
  String get logout => 'Keluar';

  @override
  String get logoutDialog => 'Apakah Anda yakin ingin keluar?';

  @override
  String get addStory => 'Tambah cerita';

  @override
  String get gallery => 'Galeri';

  @override
  String get camera => 'Kamera';

  @override
  String get writeStoryHint => 'Tulis ceritamu disini...';

  @override
  String get send => 'Kirim';

  @override
  String get dialogFillStory => 'Mohon pilih gambar dan tulis ceritamu dahulu.';

  @override
  String get loading => 'Memuat';

  @override
  String get location => 'Lokasi';

  @override
  String get chooseLocation => 'Pilih titik lokasi';

  @override
  String get choose => 'Pilih';
}
