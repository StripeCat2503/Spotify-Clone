// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpState {
  SignUpStep get step => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get privacySendNewsChecked => throw _privateConstructorUsedError;
  bool get privacyShareDataChecked => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res>;
  $Res call(
      {SignUpStep step,
      bool loading,
      bool privacySendNewsChecked,
      bool privacyShareDataChecked,
      String email,
      String name,
      String password,
      String gender});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  final SignUpState _value;
  // ignore: unused_field
  final $Res Function(SignUpState) _then;

  @override
  $Res call({
    Object? step = freezed,
    Object? loading = freezed,
    Object? privacySendNewsChecked = freezed,
    Object? privacyShareDataChecked = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? password = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as SignUpStep,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      privacySendNewsChecked: privacySendNewsChecked == freezed
          ? _value.privacySendNewsChecked
          : privacySendNewsChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyShareDataChecked: privacyShareDataChecked == freezed
          ? _value.privacyShareDataChecked
          : privacyShareDataChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$_SignUpStateCopyWith(
          _$_SignUpState value, $Res Function(_$_SignUpState) then) =
      __$$_SignUpStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {SignUpStep step,
      bool loading,
      bool privacySendNewsChecked,
      bool privacyShareDataChecked,
      String email,
      String name,
      String password,
      String gender});
}

/// @nodoc
class __$$_SignUpStateCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
    implements _$$_SignUpStateCopyWith<$Res> {
  __$$_SignUpStateCopyWithImpl(
      _$_SignUpState _value, $Res Function(_$_SignUpState) _then)
      : super(_value, (v) => _then(v as _$_SignUpState));

  @override
  _$_SignUpState get _value => super._value as _$_SignUpState;

  @override
  $Res call({
    Object? step = freezed,
    Object? loading = freezed,
    Object? privacySendNewsChecked = freezed,
    Object? privacyShareDataChecked = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? password = freezed,
    Object? gender = freezed,
  }) {
    return _then(_$_SignUpState(
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as SignUpStep,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      privacySendNewsChecked: privacySendNewsChecked == freezed
          ? _value.privacySendNewsChecked
          : privacySendNewsChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyShareDataChecked: privacyShareDataChecked == freezed
          ? _value.privacyShareDataChecked
          : privacyShareDataChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpState extends _SignUpState {
  const _$_SignUpState(
      {this.step = SignUpStep.email,
      this.loading = false,
      this.privacySendNewsChecked = false,
      this.privacyShareDataChecked = false,
      this.email = '',
      this.name = '',
      this.password = '',
      this.gender = ''})
      : super._();

  @override
  @JsonKey()
  final SignUpStep step;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool privacySendNewsChecked;
  @override
  @JsonKey()
  final bool privacyShareDataChecked;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String gender;

  @override
  String toString() {
    return 'SignUpState(step: $step, loading: $loading, privacySendNewsChecked: $privacySendNewsChecked, privacyShareDataChecked: $privacyShareDataChecked, email: $email, name: $name, password: $password, gender: $gender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpState &&
            const DeepCollectionEquality().equals(other.step, step) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.privacySendNewsChecked, privacySendNewsChecked) &&
            const DeepCollectionEquality().equals(
                other.privacyShareDataChecked, privacyShareDataChecked) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.gender, gender));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(step),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(privacySendNewsChecked),
      const DeepCollectionEquality().hash(privacyShareDataChecked),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(gender));

  @JsonKey(ignore: true)
  @override
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      __$$_SignUpStateCopyWithImpl<_$_SignUpState>(this, _$identity);
}

abstract class _SignUpState extends SignUpState {
  const factory _SignUpState(
      {final SignUpStep step,
      final bool loading,
      final bool privacySendNewsChecked,
      final bool privacyShareDataChecked,
      final String email,
      final String name,
      final String password,
      final String gender}) = _$_SignUpState;
  const _SignUpState._() : super._();

  @override
  SignUpStep get step;
  @override
  bool get loading;
  @override
  bool get privacySendNewsChecked;
  @override
  bool get privacyShareDataChecked;
  @override
  String get email;
  @override
  String get name;
  @override
  String get password;
  @override
  String get gender;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
