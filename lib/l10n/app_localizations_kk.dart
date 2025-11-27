// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'СуперБанк Демо';

  @override
  String get loginTitle => 'Кіру';

  @override
  String get registerTitle => 'Тіркелу';

  @override
  String get email => 'Электрондық пошта';

  @override
  String get password => 'Құпия сөз';

  @override
  String get confirmPassword => 'Құпия сөзді растау';

  @override
  String get minPasswordLength => 'Кемінде 6 таңба';

  @override
  String get loginButton => 'Кіру';

  @override
  String get registerButton => 'Тіркелу';

  @override
  String get logoutButton => 'Шығу';

  @override
  String get goodAfternoon => 'Қайырлы күн!';

  @override
  String get totalBalance => 'Жалпы баланс';

  @override
  String get transfer => 'Аудару';

  @override
  String get topUp => 'Толықтыру';

  @override
  String get investing => 'Инвестиции';

  @override
  String get noTransactions => 'Аудару жоқ';

  @override
  String get qrPay => 'QR Төлем';

  @override
  String get recentTransactions => 'Соңғы транзакциялар';

  @override
  String sentTo(Object name) {
    return '$name жіберілді';
  }

  @override
  String receivedFrom(Object name) {
    return '$name алды';
  }

  @override
  String get transfers => 'Аударымдар';

  @override
  String get toAccount => 'Шотқа';

  @override
  String get toCard => 'Картаға';

  @override
  String get multiCurrency => 'Көпвалюталы';

  @override
  String get amount => 'Сома';

  @override
  String get send => 'Жіберу';

  @override
  String get payments => 'Төлемдер';

  @override
  String get utilities => 'Коммуналдық қызметтер';

  @override
  String get internet => 'Интернет';

  @override
  String get paid => 'Төленді';

  @override
  String get due => 'Төлеу керек';

  @override
  String get cards => 'Карталар';

  @override
  String get myCards => 'Менің карталарым';

  @override
  String get frozen => 'Мұздатылған';

  @override
  String get active => 'Белсенді';

  @override
  String get spendingLimit => 'Шығын лимиті';

  @override
  String get expenseChart => 'Шығын графигі (Демо)';

  @override
  String get profile => 'Профиль';

  @override
  String get supportChat => 'Қолдау чаты';

  @override
  String get faq => 'Жиі қойылатын сұрақтар';

  @override
  String get settings => 'Баптаулар';

  @override
  String get closeAccount => 'Шотты жабу';

  @override
  String get language => 'Тіл';

  @override
  String get theme => 'Тақырып';

  @override
  String get lightTheme => 'Ашық тақырып';

  @override
  String get darkTheme => 'Қараңғы тақырып';

  @override
  String get systemDefault => 'Жүйелік';

  @override
  String get confirmAccountClosure => 'Шотты жабуды растаңыз';

  @override
  String get sureCloseAccount => 'Шотты жабуға сенімдісіз бе?';

  @override
  String get cancel => 'Болдырмау';

  @override
  String get closeAccountButton => 'Шотты жабу';

  @override
  String get apply => 'Өтініш беру';

  @override
  String get loans => 'Несиелер';

  @override
  String get loanStatus => 'Несие жағдайы';

  @override
  String get applyForLoan => 'Несиеге өтініш беру';

  @override
  String get openAccount => 'Шот ашу';

  @override
  String get openNewAccount => 'Жаңа шот ашу';

  @override
  String get accountType => 'Шот түрі';

  @override
  String get closeExistingAccount => 'Бар шотты жабу';

  @override
  String get accountNumber => 'Шот нөмірі';

  @override
  String get exchange => 'Айырбастау';

  @override
  String get fromCurrency => 'Валютадан';

  @override
  String get toCurrency => 'Валютаға';

  @override
  String get exchangeRate => 'Айырбас бағамы';

  @override
  String get convert => 'Ауыстыру';

  @override
  String get success => 'Сәтті';

  @override
  String get error => 'Қате';

  @override
  String get ok => 'ОК';

  @override
  String get invalidInput => 'Дұрыс емес енгізу';

  @override
  String get insufficientFunds => 'Қаражат жеткіліксіз';

  @override
  String get transactionSuccess => 'Транзакция сәтті аяқталды!';

  @override
  String get transactionFailed => 'Транзакция орындалмады';

  @override
  String get welcome => 'Қош келдіңіз';

  @override
  String get secure => 'Қауіпсіздік';

  @override
  String get getStarted => 'Бастау';

  @override
  String get account => 'Шот';
}
