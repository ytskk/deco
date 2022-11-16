import 'package:json_annotation/json_annotation.dart';

enum AppStyleType {
  @JsonValue('standard')
  standard('Platform default'),
  @JsonValue('devto')
  devto('dev.to'),
  @JsonValue('reddish')
  reddish('Reddish');

  const AppStyleType(this.title);

  final String title;
}
