import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
part 'job.g.dart';

@CopyWith()
@JsonSerializable()
class Job extends Equatable {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'company_id')
  final String? companyId;

  @JsonKey(name: 'job_title')
  final String? jobTitle;

  final String? description;
  final String? requirements;

  @JsonKey(name: 'no_of_positions')
  final num? noOfPositions;

  @JsonKey(name: 'job_type')
  final String? jobType;

  final String? location;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Job({
    this.id,
    this.companyId,
    this.createdAt,
    this.description,
    this.jobTitle,
    this.jobType,
    this.location,
    this.noOfPositions,
    this.requirements,
    this.updatedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);

  @override
  List<Object?> get props => [id ?? ''];
}
