import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/github/domain/user.dart';
part 'user_dto.freezed.dart';

@freezed
class UserDTO with _$UserDTO {
  const UserDTO._();
  const factory UserDTO({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'login') required String name,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  factory UserDTO.fromDomain(User _) {
    return UserDTO(
      name: _.name,
      avatarUrl: _.avatarUrl,
    );
  }
  User toDomain() {
    return User(
      name: name,
      avatarUrl: avatarUrl,
    );
  }
}
