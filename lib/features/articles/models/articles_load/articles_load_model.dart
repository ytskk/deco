import 'package:dev_community/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_load_model.freezed.dart';

@freezed
class ArticlesLoadModel with _$ArticlesLoadModel {
  const factory ArticlesLoadModel({
    required String type,
    @Default(0) int page,
    @Default(false) bool isLoading,
    @Default(false) bool hasReachedMax,
    @Default(false) bool hasError,
    @Default([]) List<ArticleQuickInfoModel> articles,
  }) = _ArticlesLoadModel;
}
