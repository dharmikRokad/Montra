extension StringUtils on String {
  bool get isValidPassword => RegExp(
          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
      .hasMatch(this);

  bool get isValidEmail =>
      RegExp(r'^[a-zA-Z\d._%+-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$').hasMatch(this);
}
