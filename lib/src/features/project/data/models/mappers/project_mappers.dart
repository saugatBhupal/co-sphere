import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/features/jobs/data/models/mappers/job_mappers.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/review_mapper.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/skill_mappers.dart';
import 'package:cosphere/src/features/project/data/models/mappers/task_mappers.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:cosphere/src/features/project/domain/entities/durations.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';

extension ProjectApiModelMappers on ProjectApiModel {
  Project toDomain() => Project.initial().copyWith(
        id: id,
        projectName: projectName,
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
        duration: DurationTime.initial()
            .copyWith(from: duration.from, to: duration.to),
        acceptedApplicants: acceptedApplicants
            .map((applicant) => applicant.toDomain())
            .toList(),
        rejectedApplicants: rejectedApplicants
            .map((applicant) => applicant.toDomain())
            .toList(),
        pendingApplicants:
            pendingApplicants.map((applicant) => applicant.toDomain()).toList(),
        tasks: tasks.map((task) => task.toDomain()).toList(),
        members: members.map((member) => member.toDomain()).toList(),
        reviews: reviews.map((reviews) => reviews.toDomain()).toList(),
        completionType: completionType,
        createdAt: createdAt,
      );
}

extension ProjectMappers on Project {
  ProjectApiModel toDomain() => ProjectApiModel(
        id: id,
        projectName: projectName,
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
        duration: DurationTime.initial()
            .copyWith(from: duration.from, to: duration.to),
        acceptedApplicants: acceptedApplicants
            .map((applicant) => applicant.fromDomain())
            .toList(),
        rejectedApplicants: rejectedApplicants
            .map((applicant) => applicant.fromDomain())
            .toList(),
        pendingApplicants: pendingApplicants
            .map((applicant) => applicant.fromDomain())
            .toList(),
        tasks: tasks.map((task) => task.fromDomain()).toList(),
        members: members.map((member) => member.toApiModel()).toList(),
        reviews: reviews.map((review) => review.fromDomain()).toList(),
        completionType: completionType,
        createdAt: createdAt,
      );
}
