// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companyModule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Companymodule _$CompanymoduleFromJson(Map<String, dynamic> json) =>
    _Companymodule(
      ticker: json['ticker'] as String? ?? '',
      company_name: json['company_name'] as String? ?? '',
      isin: json['isin'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] as String? ?? '',
      date: json['date'] as String? ?? '',
      change_percent: (json['change_percent'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CompanymoduleToJson(_Companymodule instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'company_name': instance.company_name,
      'isin': instance.isin,
      'price': instance.price,
      'currency': instance.currency,
      'date': instance.date,
      'change_percent': instance.change_percent,
    };
