// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'СуперБанк Демо';

  @override
  String get loginTitle => 'Войти';

  @override
  String get registerTitle => 'Регистрация';

  @override
  String get email => 'Электронная почта';

  @override
  String get password => 'Пароль';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get minPasswordLength => 'Минимум 6 символов';

  @override
  String get loginButton => 'Войти';

  @override
  String get registerButton => 'Зарегистрироваться';

  @override
  String get logoutButton => 'Выйти';

  @override
  String get goodAfternoon => 'Добрый день!';

  @override
  String get totalBalance => 'Общий баланс';

  @override
  String get transfer => 'Перевести';

  @override
  String get topUp => 'Пополнить';

  @override
  String get investing => 'Инвестиции';

  @override
  String get noTransactions => 'Нету Переводов';

  @override
  String get qrPay => 'QR Платеж';

  @override
  String get recentTransactions => 'Недавние операции';

  @override
  String sentTo(Object name) {
    return 'Отправлено $name';
  }

  @override
  String receivedFrom(Object name) {
    return 'Получено от $name';
  }

  @override
  String get transfers => 'Переводы';

  @override
  String get toAccount => 'На счет';

  @override
  String get toCard => 'На карту';

  @override
  String get multiCurrency => 'Мультивалюта';

  @override
  String get amount => 'Сумма';

  @override
  String get qrcode => 'Qrcode';

  @override
  String get send => 'Отправить';

  @override
  String get payments => 'Платежи';

  @override
  String get utilities => 'Коммуналка';

  @override
  String get internet => 'Интернет';

  @override
  String get paid => 'Оплачено';

  @override
  String get due => 'К оплате';

  @override
  String get cards => 'Карты';

  @override
  String get myCards => 'Мои карты';

  @override
  String get frozen => 'Заморожена';

  @override
  String get active => 'Активна';

  @override
  String get spendingLimit => 'Лимит расходов';

  @override
  String get expenseChart => 'График расходов (демо)';

  @override
  String get profile => 'Профиль';

  @override
  String get supportChat => 'Поддержка';

  @override
  String get faq => 'Вопросы и ответы';

  @override
  String get settings => 'Настройки';

  @override
  String get closeAccount => 'Закрыть счет';

  @override
  String get language => 'Язык';

  @override
  String get theme => 'Тема';

  @override
  String get lightTheme => 'Светлая тема';

  @override
  String get darkTheme => 'Темная тема';

  @override
  String get systemDefault => 'Системная';

  @override
  String get confirmAccountClosure => 'Подтвердите закрытие счета';

  @override
  String get sureCloseAccount => 'Вы уверены, что хотите закрыть счет?';

  @override
  String get cancel => 'Отмена';

  @override
  String get closeAccountButton => 'Закрыть счет';

  @override
  String get apply => 'Оформить';

  @override
  String get loans => 'Кредиты';

  @override
  String get loanStatus => 'Статус кредита';

  @override
  String get applyForLoan => 'Подать заявку на кредит';

  @override
  String get openAccount => 'Открыть счет';

  @override
  String get openNewAccount => 'Открытие нового счета';

  @override
  String get accountType => 'Тип счета';

  @override
  String get closeExistingAccount => 'Закрытие существующего счета';

  @override
  String get accountNumber => 'Номер счета';

  @override
  String get exchange => 'Обмен';

  @override
  String get fromCurrency => 'Из валюты';

  @override
  String get toCurrency => 'В валюту';

  @override
  String get exchangeRate => 'Курс обмена';

  @override
  String get convert => 'Конвертировать';

  @override
  String get success => 'Успех';

  @override
  String get error => 'Ошибка';

  @override
  String get ok => 'ОК';

  @override
  String get invalidInput => 'Некорректный ввод';

  @override
  String get insufficientFunds => 'Недостаточно средств';

  @override
  String get transactionSuccess => 'Операция успешно выполнена!';

  @override
  String get transactionFailed => 'Операция не выполнена';

  @override
  String get welcome => 'Добро пожаловать';

  @override
  String get secure => 'Безопасность';

  @override
  String get getStarted => 'Начать';

  @override
  String get account => 'Счет';
}
