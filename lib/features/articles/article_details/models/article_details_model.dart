import 'package:dev_community/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_details_model.freezed.dart';

@freezed
abstract class ArticleDetailsState with _$ArticleDetailsState {
  const factory ArticleDetailsState.data(ArticleDetailsModel articleDetails) =
      _Data;
  const factory ArticleDetailsState.loading() = _Loading;
  const factory ArticleDetailsState.error(Object error) = _Error;
}
