// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/github/core/infrastructure/user_dto.dart';
import 'package:repo_viewer/github/domain/github_repo.dart';
part 'github_repo_dto.freezed.dart';

String _descriptionFromJson(Object? json) {
  return (json as String?) ?? '';
}

@freezed
class GithubRepoDTO with _$GithubRepoDTO {
  const GithubRepoDTO._();
  const factory GithubRepoDTO({
    required UserDTO owner,
    required String name,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _descriptionFromJson) required String description,
    @JsonKey(name: 'stargazers_count') required int stargarzersCount,
  }) = _GithubRepoDTO;

  factory GithubRepoDTO.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoDTOFromJson(json);

  factory GithubRepoDTO.fromDomain(GithubRepo _) {
    return GithubRepoDTO(
      owner: UserDTO.fromDomain(_.owner),
      name: _.name,
      description: _.description,
      stargarzersCount: _.startGazersCount,
    );
  }

  GithubRepo toDomain() {
    return GithubRepo(
        owner: owner.toDomain(),
        name: name,
        description: description,
        startGazersCount: stargarzersCount);
  }
}
