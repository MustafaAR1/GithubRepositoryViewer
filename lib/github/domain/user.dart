import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

//THIS CLASS IS DIFFERENT FROM USERDTO BECAUSE IT ONLY RETURN THE OBJECT WHEREAS THE DTO HAS RESPONSIBILITY TO PARSE THE OBJECT
@freezed
class User with _$User {
  const User._();
  const factory User({
    required String name,
    required String avatarUrl,
  }) = _User;
}
