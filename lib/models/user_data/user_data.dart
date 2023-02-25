import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
part 'user_data.g.dart';

@CopyWith()
@JsonSerializable()
class UserData extends Equatable {
  final String? uid;
  final String? email;
  final String? name;
  final String? phone;
  final String? photoUrl;
  final String? gender;
  final bool? isInitialised;
  final DateTime? dob;
  final DateTime? createdAt;
  final DateTime? lastUpdatedAt;
  final String? notificationToken;
  final String? state;
  final String? city;
  final bool? isPhoneVerified;
  final String? userStatus;

  const UserData({
    this.uid,
    this.email,
    this.name,
    this.phone,
    this.photoUrl,
    this.gender,
    this.dob,
    this.createdAt,
    this.lastUpdatedAt,
    this.isInitialised,
    this.notificationToken,
    this.city,
    this.state,
    this.isPhoneVerified,
    this.userStatus,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  List<Object?> get props => [uid ?? ''];
}
