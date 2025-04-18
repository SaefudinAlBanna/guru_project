import 'package:get/get.dart';

import '../modules/buat_kelompok_mengaji/bindings/buat_kelompok_mengaji_binding.dart';
import '../modules/buat_kelompok_mengaji/views/buat_kelompok_mengaji_view.dart';
import '../modules/contoh/bindings/contoh_binding.dart';
import '../modules/contoh/views/contoh_view.dart';
import '../modules/daftar_fase/bindings/daftar_fase_binding.dart';
import '../modules/daftar_fase/views/daftar_fase_view.dart';
import '../modules/daftar_kelas/bindings/daftar_kelas_binding.dart';
import '../modules/daftar_kelas/views/daftar_kelas_view.dart';
import '../modules/daftar_kelas_semua_siswa/bindings/daftar_kelas_semua_siswa_binding.dart';
import '../modules/daftar_kelas_semua_siswa/views/daftar_kelas_semua_siswa_view.dart';
import '../modules/daftar_kelompok_mengaji/bindings/daftar_kelompok_mengaji_binding.dart';
import '../modules/daftar_kelompok_mengaji/views/daftar_kelompok_mengaji_view.dart';
import '../modules/daftar_nilai/bindings/daftar_nilai_binding.dart';
import '../modules/daftar_nilai/views/daftar_nilai_view.dart';
import '../modules/daftar_siswa/bindings/daftar_siswa_binding.dart';
import '../modules/daftar_siswa/views/daftar_siswa_view.dart';
import '../modules/detail_nilai/bindings/detail_nilai_binding.dart';
import '../modules/detail_nilai/views/detail_nilai_view.dart';
import '../modules/detail_siswa/bindings/detail_siswa_binding.dart';
import '../modules/detail_siswa/views/detail_siswa_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/info_sekolah/bindings/info_sekolah_binding.dart';
import '../modules/info_sekolah/views/info_sekolah_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/new_password/bindings/new_password_binding.dart';
import '../modules/new_password/views/new_password_view.dart';
import '../modules/pemberian_kelas_siswa/bindings/pemberian_kelas_siswa_binding.dart';
import '../modules/pemberian_kelas_siswa/views/pemberian_kelas_siswa_view.dart';
import '../modules/pemberian_nilai_siswa/bindings/pemberian_nilai_siswa_binding.dart';
import '../modules/pemberian_nilai_siswa/views/pemberian_nilai_siswa_view.dart';
import '../modules/tambah_kelas_baru/bindings/tambah_kelas_baru_binding.dart';
import '../modules/tambah_kelas_baru/views/tambah_kelas_baru_view.dart';
import '../modules/tambah_kelompok_mengaji/bindings/tambah_kelompok_mengaji_binding.dart';
import '../modules/tambah_kelompok_mengaji/views/tambah_kelompok_mengaji_view.dart';
import '../modules/tambah_pegawai/bindings/tambah_pegawai_binding.dart';
import '../modules/tambah_pegawai/views/tambah_pegawai_view.dart';
import '../modules/tambah_siswa/bindings/tambah_siswa_binding.dart';
import '../modules/tambah_siswa/views/tambah_siswa_view.dart';
import '../modules/tambah_siswa_kelompok/bindings/tambah_siswa_kelompok_binding.dart';
import '../modules/tambah_siswa_kelompok/views/tambah_siswa_kelompok_view.dart';
import '../modules/tambah_tahun_ajaran/bindings/tambah_tahun_ajaran_binding.dart';
import '../modules/tambah_tahun_ajaran/views/tambah_tahun_ajaran_view.dart';
import '../modules/update_kelas_tahun_ajaran/bindings/update_kelas_tahun_ajaran_binding.dart';
import '../modules/update_kelas_tahun_ajaran/views/update_kelas_tahun_ajaran_view.dart';
import '../modules/update_password/bindings/update_password_binding.dart';
import '../modules/update_password/views/update_password_view.dart';
import '../modules/update_pegawai/bindings/update_pegawai_binding.dart';
import '../modules/update_pegawai/views/update_pegawai_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_PEGAWAI,
      page: () => const TambahPegawaiView(),
      binding: TambahPegawaiBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => const NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PEGAWAI,
      page: () => UpdatePegawaiView(),
      binding: UpdatePegawaiBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PASSWORD,
      page: () => const UpdatePasswordView(),
      binding: UpdatePasswordBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_SISWA,
      page: () => const TambahSiswaView(),
      binding: TambahSiswaBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_SISWA,
      page: () => const DaftarSiswaView(),
      binding: DaftarSiswaBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SISWA,
      page: () => DetailSiswaView(),
      binding: DetailSiswaBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_KELAS,
      page: () => DaftarKelasView(),
      binding: DaftarKelasBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_NILAI,
      page: () => DaftarNilaiView(),
      binding: DaftarNilaiBinding(),
    ),
    GetPage(
      name: _Paths.PEMBERIAN_NILAI_SISWA,
      page: () => const PemberianNilaiSiswaView(),
      binding: PemberianNilaiSiswaBinding(),
    ),
    GetPage(
      name: _Paths.CONTOH,
      page: () => ContohView(),
      binding: ContohBinding(),
    ),
    GetPage(
      name: _Paths.INFO_SEKOLAH,
      page: () => const InfoSekolahView(),
      binding: InfoSekolahBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_NILAI,
      page: () => const DetailNilaiView(),
      binding: DetailNilaiBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_KELOMPOK_MENGAJI,
      page: () => const TambahKelompokMengajiView(),
      binding: TambahKelompokMengajiBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_KELAS_TAHUN_AJARAN,
      page: () => const UpdateKelasTahunAjaranView(),
      binding: UpdateKelasTahunAjaranBinding(),
    ),
    GetPage(
      name: _Paths.PEMBERIAN_KELAS_SISWA,
      page: () => const PemberianKelasSiswaView(),
      binding: PemberianKelasSiswaBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_TAHUN_AJARAN,
      page: () => const TambahTahunAjaranView(),
      binding: TambahTahunAjaranBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_KELAS_BARU,
      page: () => const TambahKelasBaruView(),
      binding: TambahKelasBaruBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_KELAS_SEMUA_SISWA,
      page: () => const DaftarKelasSemuaSiswaView(),
      binding: DaftarKelasSemuaSiswaBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_KELOMPOK_MENGAJI,
      page: () => const DaftarKelompokMengajiView(),
      binding: DaftarKelompokMengajiBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_SISWA_KELOMPOK,
      page: () => const TambahSiswaKelompokView(),
      binding: TambahSiswaKelompokBinding(),
    ),
    GetPage(
      name: _Paths.BUAT_KELOMPOK_MENGAJI,
      page: () => const BuatKelompokMengajiView(),
      binding: BuatKelompokMengajiBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_FASE,
      page: () => DaftarFaseView(),
      binding: DaftarFaseBinding(),
    ),
  ];
}
