import 'package:freezed_annotation/freezed_annotation.dart';

part 'companyModule.freezed.dart';
part 'companyModule.g.dart';

@freezed
abstract class Companymodule with _$Companymodule {
  factory Companymodule({
    @Default('') String ticker,
    @Default('') String company_name,
    @Default('') String isin,
    @Default(0.0) double price,
    @Default('') String currency,
    @Default('') String date,
    @Default(0.0) double change_percent,
  }) = _Companymodule;

  factory Companymodule.fromJson(Map<String, dynamic> json) =>
      _$CompanymoduleFromJson(json);
}
