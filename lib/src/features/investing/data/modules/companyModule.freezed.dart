// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'companyModule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Companymodule {

 String get ticker; String get company_name; String get isin; double get price; String get currency; String get date; double get change_percent;
/// Create a copy of Companymodule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanymoduleCopyWith<Companymodule> get copyWith => _$CompanymoduleCopyWithImpl<Companymodule>(this as Companymodule, _$identity);

  /// Serializes this Companymodule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Companymodule&&(identical(other.ticker, ticker) || other.ticker == ticker)&&(identical(other.company_name, company_name) || other.company_name == company_name)&&(identical(other.isin, isin) || other.isin == isin)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.date, date) || other.date == date)&&(identical(other.change_percent, change_percent) || other.change_percent == change_percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticker,company_name,isin,price,currency,date,change_percent);

@override
String toString() {
  return 'Companymodule(ticker: $ticker, company_name: $company_name, isin: $isin, price: $price, currency: $currency, date: $date, change_percent: $change_percent)';
}


}

/// @nodoc
abstract mixin class $CompanymoduleCopyWith<$Res>  {
  factory $CompanymoduleCopyWith(Companymodule value, $Res Function(Companymodule) _then) = _$CompanymoduleCopyWithImpl;
@useResult
$Res call({
 String ticker, String company_name, String isin, double price, String currency, String date, double change_percent
});




}
/// @nodoc
class _$CompanymoduleCopyWithImpl<$Res>
    implements $CompanymoduleCopyWith<$Res> {
  _$CompanymoduleCopyWithImpl(this._self, this._then);

  final Companymodule _self;
  final $Res Function(Companymodule) _then;

/// Create a copy of Companymodule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticker = null,Object? company_name = null,Object? isin = null,Object? price = null,Object? currency = null,Object? date = null,Object? change_percent = null,}) {
  return _then(_self.copyWith(
ticker: null == ticker ? _self.ticker : ticker // ignore: cast_nullable_to_non_nullable
as String,company_name: null == company_name ? _self.company_name : company_name // ignore: cast_nullable_to_non_nullable
as String,isin: null == isin ? _self.isin : isin // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,change_percent: null == change_percent ? _self.change_percent : change_percent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Companymodule].
extension CompanymodulePatterns on Companymodule {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Companymodule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Companymodule() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Companymodule value)  $default,){
final _that = this;
switch (_that) {
case _Companymodule():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Companymodule value)?  $default,){
final _that = this;
switch (_that) {
case _Companymodule() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ticker,  String company_name,  String isin,  double price,  String currency,  String date,  double change_percent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Companymodule() when $default != null:
return $default(_that.ticker,_that.company_name,_that.isin,_that.price,_that.currency,_that.date,_that.change_percent);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ticker,  String company_name,  String isin,  double price,  String currency,  String date,  double change_percent)  $default,) {final _that = this;
switch (_that) {
case _Companymodule():
return $default(_that.ticker,_that.company_name,_that.isin,_that.price,_that.currency,_that.date,_that.change_percent);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ticker,  String company_name,  String isin,  double price,  String currency,  String date,  double change_percent)?  $default,) {final _that = this;
switch (_that) {
case _Companymodule() when $default != null:
return $default(_that.ticker,_that.company_name,_that.isin,_that.price,_that.currency,_that.date,_that.change_percent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Companymodule implements Companymodule {
   _Companymodule({this.ticker = '', this.company_name = '', this.isin = '', this.price = 0.0, this.currency = '', this.date = '', this.change_percent = 0.0});
  factory _Companymodule.fromJson(Map<String, dynamic> json) => _$CompanymoduleFromJson(json);

@override@JsonKey() final  String ticker;
@override@JsonKey() final  String company_name;
@override@JsonKey() final  String isin;
@override@JsonKey() final  double price;
@override@JsonKey() final  String currency;
@override@JsonKey() final  String date;
@override@JsonKey() final  double change_percent;

/// Create a copy of Companymodule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanymoduleCopyWith<_Companymodule> get copyWith => __$CompanymoduleCopyWithImpl<_Companymodule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanymoduleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Companymodule&&(identical(other.ticker, ticker) || other.ticker == ticker)&&(identical(other.company_name, company_name) || other.company_name == company_name)&&(identical(other.isin, isin) || other.isin == isin)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.date, date) || other.date == date)&&(identical(other.change_percent, change_percent) || other.change_percent == change_percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticker,company_name,isin,price,currency,date,change_percent);

@override
String toString() {
  return 'Companymodule(ticker: $ticker, company_name: $company_name, isin: $isin, price: $price, currency: $currency, date: $date, change_percent: $change_percent)';
}


}

/// @nodoc
abstract mixin class _$CompanymoduleCopyWith<$Res> implements $CompanymoduleCopyWith<$Res> {
  factory _$CompanymoduleCopyWith(_Companymodule value, $Res Function(_Companymodule) _then) = __$CompanymoduleCopyWithImpl;
@override @useResult
$Res call({
 String ticker, String company_name, String isin, double price, String currency, String date, double change_percent
});




}
/// @nodoc
class __$CompanymoduleCopyWithImpl<$Res>
    implements _$CompanymoduleCopyWith<$Res> {
  __$CompanymoduleCopyWithImpl(this._self, this._then);

  final _Companymodule _self;
  final $Res Function(_Companymodule) _then;

/// Create a copy of Companymodule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticker = null,Object? company_name = null,Object? isin = null,Object? price = null,Object? currency = null,Object? date = null,Object? change_percent = null,}) {
  return _then(_Companymodule(
ticker: null == ticker ? _self.ticker : ticker // ignore: cast_nullable_to_non_nullable
as String,company_name: null == company_name ? _self.company_name : company_name // ignore: cast_nullable_to_non_nullable
as String,isin: null == isin ? _self.isin : isin // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,change_percent: null == change_percent ? _self.change_percent : change_percent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
