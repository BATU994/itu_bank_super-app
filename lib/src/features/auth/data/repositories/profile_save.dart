import 'package:bank_application/src/features/auth/data/modules/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileInfo {
  Future<void> saveProfileInfo(
    String number,
    String password,
    int cardNumber,
    String exDate,
    int cvc,
    int money,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('number', number);
    await prefs.setString('password', password);
    await prefs.setInt('cardNumber', cardNumber);
    await prefs.setInt('cvc', cvc);
    await prefs.setString('exDate', exDate);
    await prefs.setInt('money', money);
  }

  Future<void> changeMoney(int money) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('money', money);
  }

  Future<int> getMoney() async {
    final prefs = await SharedPreferences.getInstance();
    int money = prefs.getInt("money")!;
    return money;
  }

  Future<void> deleteInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('number');
    await prefs.remove('password');
    await prefs.remove('cardNumber');
    await prefs.remove('cvc');
    await prefs.remove('exDate');
  }

  Future<UserModel> getProfileInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return UserModel(
      cardNumber: prefs.getInt("cardNumber")!,
      password: prefs.getString("password")!,
      cvc: prefs.getInt("cvc")!,
      exDate: prefs.getString("exDate")!,
      number: prefs.getString("number")!,
    );
  }

  Future<UserUI> getProfileUI() async {
    final prefs = await SharedPreferences.getInstance();
    return UserUI(
      cardNumber: prefs.getInt("cardNumber")!,
      number: prefs.getString("number")!,
    );
  }
}
