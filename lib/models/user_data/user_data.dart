import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
part 'user_data.g.dart';

@CopyWith()
@JsonSerializable()
class UserData extends Equatable {

  @JsonKey(name:'_id')
  final String? uid;

  final String? fullname;
  final String? email;

  @JsonKey(name:'mobile_no')
  final String? mobileNo;

  @JsonKey(name:'linkedin_link')
  final String? linkedinUrl;

  final String? photoUrl;


  const UserData({
    this.uid,
    this.email,
    this.fullname,
    this.linkedinUrl,
    this.mobileNo,
    this.photoUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  List<Object?> get props => [uid ?? ''];
}
