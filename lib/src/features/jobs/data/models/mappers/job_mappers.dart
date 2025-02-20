import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/features/jobs/data/models/applicants_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/job_api_model.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/skill_mappers.dart';

extension ApplicantsApiModelMappers on ApplicantsApiModel {
  Applicants toDomain() => Applicants.initial().copyWith(
        id: id,
        user: user.toDomain(),
        status: status,
        date: date,
      );
}

extension ApplicantsMappers on Applicants {
  ApplicantsApiModel fromDomain() => ApplicantsApiModel(
        id: id,
        user: user.toApiModel(),
        status: status,
        date: date,
      );
}

extension JobApiModelMappers on JobApiModel {
  Job toDomain() => Job.initial().copyWith(
        id: id,
        jobName: jobName,
        position: position,
        address: address,
        postedBy: postedBy.toDomain(),
        skills: skills.map((skill) => skill.toDomain()).toList(),
        companyName: companyName,
        site: site,
        status: status,
        salary: Salary.initial().copyWith(max: salary.max, min: salary.min),
        likesCount: likesCount,
        likes: likes.map((like) => like.toDomain()).toList(),
        applicants:
            applicants.map((applicant) => applicant.toDomain()).toList(),
        hired: hired.map((hire) => hire.toDomain()).toList(),
        createdAt: createdAt,
      );
}

extension JobMappers on Job {
  JobApiModel toDomain() => JobApiModel(
        id: id,
        jobName: jobName,
        position: position,
        address: address,
        postedBy: postedBy.toApiModel(),
        skills: skills.map((skill) => skill.fromDomain()).toList(),
        companyName: companyName,
        site: site,
        status: status,
        salary: Salary.initial().copyWith(max: salary.max, min: salary.min),
        likesCount: likesCount,
        likes: likes.map((like) => like.toApiModel()).toList(),
        applicants:
            applicants.map((applicant) => applicant.fromDomain()).toList(),
        hired: hired.map((hire) => hire.toApiModel()).toList(),
        createdAt: createdAt,
      );
}
