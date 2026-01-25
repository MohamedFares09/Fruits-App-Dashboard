class CustomException implements Exception {
  final String message;
  CustomException(this.message);
  @override
  String toString() {
    return message;
  }
}

class ServerException extends CustomException {
  ServerException(super.message);

  static void handleFirebaseAuthException(dynamic e) {
    if (e.code == 'user-not-found') {
      throw CustomException('. الرجاء التسجيل أولا');
    } else if (e.code == 'wrong-password') {
      throw CustomException('البريد الالكتروني او كلمة المرور غير صحيحة');
    } else if (e.code == 'invalid-email') {
      throw CustomException('البريد الالكتروني غير صالح');
    } else if (e.code == "network-request-failed") {
      throw CustomException('برجاء التحقق من اتصالك بالانترنت');
    } else if (e.code == "operation-not-allowed") {
      throw CustomException('تم تعطيل هذا الحساب. الرجاء الاتصال بالدعم.');
    } else if (e.code == "invalid-credential") {
      throw CustomException('البريد الالكتروني او كلمة المرور غير صحيحة');
    } else if (e.code == 'account-exists-with-different-credential') {
      throw CustomException('البريد الالكتروني مرتبط بحساب اخر');
    }
    else {
    throw CustomException(e.toString());
  }
  } 
}