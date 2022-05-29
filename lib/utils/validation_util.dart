///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/29 16:01
///

class ValidationUtil {
  static final RegExp _emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  static final RegExp _pwdRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[\S]{6,20}$');

  static bool isValidEmail(String input) => _emailRegex.hasMatch(input);

  static bool isValidPwd(String input) => _pwdRegex.hasMatch(input);
}
