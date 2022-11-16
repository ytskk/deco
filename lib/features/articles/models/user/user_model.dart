import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserQuickInfoModel with _$UserQuickInfoModel {
  const factory UserQuickInfoModel({
    @JsonKey(name: 'user_id') required int id,
    required String name,
    required String username,
    @JsonKey(name: 'profile_image') required String profileImage,
  }) = _UserModel;

  factory UserQuickInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserQuickInfoModelFromJson(json);
}
