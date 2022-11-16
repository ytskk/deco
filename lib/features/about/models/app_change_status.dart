import 'package:freezed_annotation/freezed_annotation.dart';

enum AppChangeStatus {
  @JsonValue('new')
  newFeature,
  @JsonValue('improved')
  improved,
  @JsonValue('fixed')
  fixed;
}
