import 'package:get/get.dart';

class TextInputValidatorController extends GetxController {
  String? validatorIdentifier(String? val) {
    if (val!.contains(' ')) {
      return 'Identifikasi Anda menggunakan spasi';
    }

    return (GetUtils.isEmail(val)) ? null : 'Identifikasi Anda salah';
  }

  String? validatorPassword(String? val) {
    return (val!.length >= 6) ? null : 'Kata sandi minimal 6 digit';
  }

  String? validatorFullName(String? val) {
    return (val!.length >= 3) ? null : 'Silakan masukkan nama lengkap';
  }

  String? validatorNIK(String? val) {
    return (val!.length >= 16) ? null : 'NIK kurang lengkap';
  }

  String? validatorNumberPhone(String? val) {
    return (GetUtils.isPhoneNumber(val!))
        ? null
        : 'Periksa kembali nomor telepon Anda';
  }

  String? validatorEmail(String? val) {
    if (val!.contains(' ')) {
      return 'Email Anda menggunakan spasi';
    }

    return (GetUtils.isEmail(val)) ? null : 'Email Anda tidak valid';
  }

  String? validatorAddress(String? val) {
    return (val != null) ? null : 'Alamat belum di isi';
  }

  String? validatorConfirmationPassword(
      {String? val, required String passwordTextEditingController}) {
    return (val == passwordTextEditingController)
        ? null
        : 'Password Anda tidak sama';
  }
}
