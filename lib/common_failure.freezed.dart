// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonFailure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) data,
    required TResult Function(String message) noData,
    required TResult Function(String message, int code) server,
    required TResult Function(String message) noConnection,
    required TResult Function(String message) userLevel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? data,
    TResult? Function(String message)? noData,
    TResult? Function(String message, int code)? server,
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? userLevel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? data,
    TResult Function(String message)? noData,
    TResult Function(String message, int code)? server,
    TResult Function(String message)? noConnection,
    TResult Function(String message)? userLevel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Server value) server,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(_UserLevel value) userLevel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_NoData value)? noData,
    TResult? Function(_Server value)? server,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(_UserLevel value)? userLevel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_NoData value)? noData,
    TResult Function(_Server value)? server,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(_UserLevel value)? userLevel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommonFailureCopyWith<CommonFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonFailureCopyWith<$Res> {
  factory $CommonFailureCopyWith(
          CommonFailure value, $Res Function(CommonFailure) then) =
      _$CommonFailureCopyWithImpl<$Res, CommonFailure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CommonFailureCopyWithImpl<$Res, $Val extends CommonFailure>
    implements $CommonFailureCopyWith<$Res> {
  _$CommonFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $CommonFailureCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res>
    extends _$CommonFailureCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Data(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Data extends _Data {
  const _$_Data({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'CommonFailure.data(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) data,
    required TResult Function(String message) noData,
    required TResult Function(String message, int code) server,
    required TResult Function(String message) noConnection,
    required TResult Function(String message) userLevel,
  }) {
    return data(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? data,
    TResult? Function(String message)? noData,
    TResult? Function(String message, int code)? server,
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? userLevel,
  }) {
    return data?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? data,
    TResult Function(String message)? noData,
    TResult Function(String message, int code)? server,
    TResult Function(String message)? noConnection,
    TResult Function(String message)? userLevel,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Server value) server,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(_UserLevel value) userLevel,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_NoData value)? noData,
    TResult? Function(_Server value)? server,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(_UserLevel value)? userLevel,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_NoData value)? noData,
    TResult Function(_Server value)? server,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(_UserLevel value)? userLevel,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data extends CommonFailure {
  const factory _Data({required final String message}) = _$_Data;
  const _Data._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NoDataCopyWith<$Res>
    implements $CommonFailureCopyWith<$Res> {
  factory _$$_NoDataCopyWith(_$_NoData value, $Res Function(_$_NoData) then) =
      __$$_NoDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_NoDataCopyWithImpl<$Res>
    extends _$CommonFailureCopyWithImpl<$Res, _$_NoData>
    implements _$$_NoDataCopyWith<$Res> {
  __$$_NoDataCopyWithImpl(_$_NoData _value, $Res Function(_$_NoData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_NoData(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NoData extends _NoData {
  const _$_NoData({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'CommonFailure.noData(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoData &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoDataCopyWith<_$_NoData> get copyWith =>
      __$$_NoDataCopyWithImpl<_$_NoData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) data,
    required TResult Function(String message) noData,
    required TResult Function(String message, int code) server,
    required TResult Function(String message) noConnection,
    required TResult Function(String message) userLevel,
  }) {
    return noData(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? data,
    TResult? Function(String message)? noData,
    TResult? Function(String message, int code)? server,
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? userLevel,
  }) {
    return noData?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? data,
    TResult Function(String message)? noData,
    TResult Function(String message, int code)? server,
    TResult Function(String message)? noConnection,
    TResult Function(String message)? userLevel,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Server value) server,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(_UserLevel value) userLevel,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_NoData value)? noData,
    TResult? Function(_Server value)? server,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(_UserLevel value)? userLevel,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_NoData value)? noData,
    TResult Function(_Server value)? server,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(_UserLevel value)? userLevel,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class _NoData extends CommonFailure {
  const factory _NoData({required final String message}) = _$_NoData;
  const _NoData._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_NoDataCopyWith<_$_NoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ServerCopyWith<$Res>
    implements $CommonFailureCopyWith<$Res> {
  factory _$$_ServerCopyWith(_$_Server value, $Res Function(_$_Server) then) =
      __$$_ServerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int code});
}

/// @nodoc
class __$$_ServerCopyWithImpl<$Res>
    extends _$CommonFailureCopyWithImpl<$Res, _$_Server>
    implements _$$_ServerCopyWith<$Res> {
  __$$_ServerCopyWithImpl(_$_Server _value, $Res Function(_$_Server) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_$_Server(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Server extends _Server {
  const _$_Server({required this.message, required this.code}) : super._();

  @override
  final String message;
  @override
  final int code;

  @override
  String toString() {
    return 'CommonFailure.server(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Server &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServerCopyWith<_$_Server> get copyWith =>
      __$$_ServerCopyWithImpl<_$_Server>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) data,
    required TResult Function(String message) noData,
    required TResult Function(String message, int code) server,
    required TResult Function(String message) noConnection,
    required TResult Function(String message) userLevel,
  }) {
    return server(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? data,
    TResult? Function(String message)? noData,
    TResult? Function(String message, int code)? server,
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? userLevel,
  }) {
    return server?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? data,
    TResult Function(String message)? noData,
    TResult Function(String message, int code)? server,
    TResult Function(String message)? noConnection,
    TResult Function(String message)? userLevel,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Server value) server,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(_UserLevel value) userLevel,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_NoData value)? noData,
    TResult? Function(_Server value)? server,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(_UserLevel value)? userLevel,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_NoData value)? noData,
    TResult Function(_Server value)? server,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(_UserLevel value)? userLevel,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _Server extends CommonFailure {
  const factory _Server(
      {required final String message, required final int code}) = _$_Server;
  const _Server._() : super._();

  @override
  String get message;
  int get code;
  @override
  @JsonKey(ignore: true)
  _$$_ServerCopyWith<_$_Server> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoConnectionCopyWith<$Res>
    implements $CommonFailureCopyWith<$Res> {
  factory _$$NoConnectionCopyWith(
          _$NoConnection value, $Res Function(_$NoConnection) then) =
      __$$NoConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NoConnectionCopyWithImpl<$Res>
    extends _$CommonFailureCopyWithImpl<$Res, _$NoConnection>
    implements _$$NoConnectionCopyWith<$Res> {
  __$$NoConnectionCopyWithImpl(
      _$NoConnection _value, $Res Function(_$NoConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NoConnection(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoConnection extends NoConnection {
  const _$NoConnection({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'CommonFailure.noConnection(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoConnection &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoConnectionCopyWith<_$NoConnection> get copyWith =>
      __$$NoConnectionCopyWithImpl<_$NoConnection>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) data,
    required TResult Function(String message) noData,
    required TResult Function(String message, int code) server,
    required TResult Function(String message) noConnection,
    required TResult Function(String message) userLevel,
  }) {
    return noConnection(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? data,
    TResult? Function(String message)? noData,
    TResult? Function(String message, int code)? server,
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? userLevel,
  }) {
    return noConnection?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? data,
    TResult Function(String message)? noData,
    TResult Function(String message, int code)? server,
    TResult Function(String message)? noConnection,
    TResult Function(String message)? userLevel,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Server value) server,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(_UserLevel value) userLevel,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_NoData value)? noData,
    TResult? Function(_Server value)? server,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(_UserLevel value)? userLevel,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_NoData value)? noData,
    TResult Function(_Server value)? server,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(_UserLevel value)? userLevel,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection extends CommonFailure {
  const factory NoConnection({required final String message}) = _$NoConnection;
  const NoConnection._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NoConnectionCopyWith<_$NoConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UserLevelCopyWith<$Res>
    implements $CommonFailureCopyWith<$Res> {
  factory _$$_UserLevelCopyWith(
          _$_UserLevel value, $Res Function(_$_UserLevel) then) =
      __$$_UserLevelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_UserLevelCopyWithImpl<$Res>
    extends _$CommonFailureCopyWithImpl<$Res, _$_UserLevel>
    implements _$$_UserLevelCopyWith<$Res> {
  __$$_UserLevelCopyWithImpl(
      _$_UserLevel _value, $Res Function(_$_UserLevel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_UserLevel(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserLevel extends _UserLevel {
  const _$_UserLevel({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'CommonFailure.userLevel(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLevel &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserLevelCopyWith<_$_UserLevel> get copyWith =>
      __$$_UserLevelCopyWithImpl<_$_UserLevel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) data,
    required TResult Function(String message) noData,
    required TResult Function(String message, int code) server,
    required TResult Function(String message) noConnection,
    required TResult Function(String message) userLevel,
  }) {
    return userLevel(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? data,
    TResult? Function(String message)? noData,
    TResult? Function(String message, int code)? server,
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? userLevel,
  }) {
    return userLevel?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? data,
    TResult Function(String message)? noData,
    TResult Function(String message, int code)? server,
    TResult Function(String message)? noConnection,
    TResult Function(String message)? userLevel,
    required TResult orElse(),
  }) {
    if (userLevel != null) {
      return userLevel(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Server value) server,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(_UserLevel value) userLevel,
  }) {
    return userLevel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_NoData value)? noData,
    TResult? Function(_Server value)? server,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(_UserLevel value)? userLevel,
  }) {
    return userLevel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_NoData value)? noData,
    TResult Function(_Server value)? server,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(_UserLevel value)? userLevel,
    required TResult orElse(),
  }) {
    if (userLevel != null) {
      return userLevel(this);
    }
    return orElse();
  }
}

abstract class _UserLevel extends CommonFailure {
  const factory _UserLevel({required final String message}) = _$_UserLevel;
  const _UserLevel._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_UserLevelCopyWith<_$_UserLevel> get copyWith =>
      throw _privateConstructorUsedError;
}
