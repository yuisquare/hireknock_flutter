// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JobCWProxy {
  Job id(String? id);

  Job companyId(String? companyId);

  Job createdAt(DateTime? createdAt);

  Job description(String? description);

  Job jobTitle(String? jobTitle);

  Job jobType(String? jobType);

  Job location(String? location);

  Job noOfPositions(num? noOfPositions);

  Job requirements(String? requirements);

  Job updatedAt(DateTime? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Job(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Job(...).copyWith(id: 12, name: "My name")
  /// ````
  Job call({
    String? id,
    String? companyId,
    DateTime? createdAt,
    String? description,
    String? jobTitle,
    String? jobType,
    String? location,
    num? noOfPositions,
    String? requirements,
    DateTime? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJob.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJob.copyWith.fieldName(...)`
class _$JobCWProxyImpl implements _$JobCWProxy {
  const _$JobCWProxyImpl(this._value);

  final Job _value;

  @override
  Job id(String? id) => this(id: id);

  @override
  Job companyId(String? companyId) => this(companyId: companyId);

  @override
  Job createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  Job description(String? description) => this(description: description);

  @override
  Job jobTitle(String? jobTitle) => this(jobTitle: jobTitle);

  @override
  Job jobType(String? jobType) => this(jobType: jobType);

  @override
  Job location(String? location) => this(location: location);

  @override
  Job noOfPositions(num? noOfPositions) => this(noOfPositions: noOfPositions);

  @override
  Job requirements(String? requirements) => this(requirements: requirements);

  @override
  Job updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Job(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Job(...).copyWith(id: 12, name: "My name")
  /// ````
  Job call({
    Object? id = const $CopyWithPlaceholder(),
    Object? companyId = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? jobTitle = const $CopyWithPlaceholder(),
    Object? jobType = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? noOfPositions = const $CopyWithPlaceholder(),
    Object? requirements = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Job(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      companyId: companyId == const $CopyWithPlaceholder()
          ? _value.companyId
          // ignore: cast_nullable_to_non_nullable
          : companyId as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      jobTitle: jobTitle == const $CopyWithPlaceholder()
          ? _value.jobTitle
          // ignore: cast_nullable_to_non_nullable
          : jobTitle as String?,
      jobType: jobType == const $CopyWithPlaceholder()
          ? _value.jobType
          // ignore: cast_nullable_to_non_nullable
          : jobType as String?,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
      noOfPositions: noOfPositions == const $CopyWithPlaceholder()
          ? _value.noOfPositions
          // ignore: cast_nullable_to_non_nullable
          : noOfPositions as num?,
      requirements: requirements == const $CopyWithPlaceholder()
          ? _value.requirements
          // ignore: cast_nullable_to_non_nullable
          : requirements as String?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
    );
  }
}

extension $JobCopyWith on Job {
  /// Returns a callable class that can be used as follows: `instanceOfJob.copyWith(...)` or like so:`instanceOfJob.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JobCWProxy get copyWith => _$JobCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: json['_id'] as String?,
      companyId: json['company_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String?,
      jobTitle: json['job_title'] as String?,
      jobType: json['job_type'] as String?,
      location: json['location'] as String?,
      noOfPositions: json['no_of_positions'] as num?,
      requirements: json['requirements'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      '_id': instance.id,
      'company_id': instance.companyId,
      'job_title': instance.jobTitle,
      'description': instance.description,
      'requirements': instance.requirements,
      'no_of_positions': instance.noOfPositions,
      'job_type': instance.jobType,
      'location': instance.location,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
