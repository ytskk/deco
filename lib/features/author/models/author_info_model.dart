import 'package:dev_community/features/features.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

@immutable
class AuthorInfoModel {
  const AuthorInfoModel({
    required this.username,
    required this.name,
    required this.profileImage,
    this.location,
    this.githubUsername,
    required this.joinedAt,
    this.summary,
    this.twitterUsername,
    this.websiteUrl,
    required this.type,
    this.tagLine,
    this.techStack,
    this.story,
  });

  factory AuthorInfoModel.fromUserModel(UserModel user) {
    return AuthorInfoModel(
      type: AuthorType.user,
      username: user.username,
      name: user.name,
      profileImage: user.profileImage,
      location: user.location,
      githubUsername: user.githubUsername,
      joinedAt: user.joinedAt,
      summary: user.summary,
      twitterUsername: user.twitterUsername,
      websiteUrl: user.websiteUrl,
    );
  }

  factory AuthorInfoModel.fromOrganizationModel(
    OrganizationModel organization,
  ) {
    return AuthorInfoModel(
      type: AuthorType.organization,
      username: organization.username,
      name: organization.name,
      profileImage: organization.profileImage,
      location: organization.location,
      githubUsername: organization.githubUsername,
      joinedAt:
          DateFormat('MMM d, y').format(DateTime.parse(organization.joinedAt)),
      summary: organization.summary,
      twitterUsername: organization.twitterUsername,
      websiteUrl: organization.url,
      story: organization.story,
      tagLine: organization.tagLine,
      techStack: organization.techStack,
    );
  }

  final AuthorType type;
  final String username;
  final String name;
  final String profileImage;
  final String? twitterUsername;
  final String? githubUsername;
  final String? summary;
  final String? story;
  final String? location;
  final String? websiteUrl;
  final String joinedAt;
  // Organization only
  final String? techStack;
  final String? tagLine;

  bool get isOrganization => type == AuthorType.organization;
}

enum AuthorType {
  user,
  organization,
}
