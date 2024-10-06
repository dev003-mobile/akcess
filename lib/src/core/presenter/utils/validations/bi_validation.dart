class BIValidation {
  static bool isValidBI(String bi) {
    final RegExp regExp = RegExp(r'^\d{9}[a-zA-Z]{2}\d{3}$');
    return regExp.hasMatch(bi);
  }
}