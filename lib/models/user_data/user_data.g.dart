// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserDataCWProxy {
  UserData uid(String? uid);

  UserData email(String? email);

  UserData fullname(String? fullname);

  UserData linkedinUrl(String? linkedinUrl);

  UserData mobileNo(String? mobileNo);

  UserData photoUrl(String? photoUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserData(...).copyWith(id: 12, name: "My name")
  /// ````
  UserData call({
    String? uid,
    String? email,
    String? fullname,
    String? linkedinUrl,
    String? mobileNo,
    String? photoUrl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserData.copyWith.fieldName(...)`
class _$UserDataCWProxyImpl implements _$UserDataCWProxy {
  const _$UserDataCWProxyImpl(this._value);

  final UserData _value;

  @override
  UserData uid(String? uid) => this(uid: uid);

  @override
  UserData email(String? email) => this(email: email);

  @override
  UserData fullname(String? fullname) => this(fullname: fullname);

  @override
  UserData linkedinUrl(String? linkedinUrl) => this(linkedinUrl: linkedinUrl);

  @override
  UserData mobileNo(String? mobileNo) => this(mobileNo: mobileNo);

  @override
  UserData photoUrl(String? photoUrl) => this(photoUrl: photoUrl);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserData(...).copyWith(id: 12, name: "My name")
  /// ````
  UserData call({
    Object? uid = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? fullname = const $CopyWithPlaceholder(),
    Object? linkedinUrl = const $CopyWithPlaceholder(),
    Object? mobileNo = const $CopyWithPlaceholder(),
    Object? photoUrl = const $CopyWithPlaceholder(),
  }) {
    return UserData(
      uid: uid == const $CopyWithPlaceholder()
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      fullname: fullname == const $CopyWithPlaceholder()
          ? _value.fullname
          // ignore: cast_nullable_to_non_nullable
          : fullname as String?,
      linkedinUrl: linkedinUrl == const $CopyWithPlaceholder()
          ? _value.linkedinUrl
          // ignore: cast_nullable_to_non_nullable
          : linkedinUrl as String?,
      mobileNo: mobileNo == const $CopyWithPlaceholder()
          ? _value.mobileNo
          // ignore: cast_nullable_to_non_nullable
          : mobileNo as String?,
      photoUrl: photoUrl == const $CopyWithPlaceholder()
          ? _value.photoUrl
          // ignore: cast_nullable_to_non_nullable
          : photoUrl as String?,
    );
  }
}

extension $UserDataCopyWith on UserData {
  /// Returns a callable class that can be used as follows: `instanceOfUserData.copyWith(...)` or like so:`instanceOfUserData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserDataCWProxy get copyWith => _$UserDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      uid: json['_id'] as String?,
      email: json['email'] as String?,
      fullname: json['fullname'] as String?,
      linkedinUrl: json['linkedin_link'] as String?,
      mobileNo: json['mobile_no'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      '_id': instance.uid,
      'fullname': instance.fullname,
      'email': instance.email,
      'mobile_no': instance.mobileNo,
      'linkedin_link': instance.linkedinUrl,
      'photoUrl': instance.photoUrl,
    };
