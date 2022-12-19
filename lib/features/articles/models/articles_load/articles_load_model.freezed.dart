// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_load_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticlesLoadModel {
  String get type => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  List<ArticleQuickInfoModel> get articles =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticlesLoadModelCopyWith<ArticlesLoadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesLoadModelCopyWith<$Res> {
  factory $ArticlesLoadModelCopyWith(
          ArticlesLoadModel value, $Res Function(ArticlesLoadModel) then) =
      _$ArticlesLoadModelCopyWithImpl<$Res, ArticlesLoadModel>;
  @useResult
  $Res call(
      {String type,
      int page,
      bool isLoading,
      bool hasReachedMax,
      bool hasError,
      Object? error,
      List<ArticleQuickInfoModel> articles});
}

/// @nodoc
class _$ArticlesLoadModelCopyWithImpl<$Res, $Val extends ArticlesLoadModel>
    implements $ArticlesLoadModelCopyWith<$Res> {
  _$ArticlesLoadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? page = null,
    Object? isLoading = null,
    Object? hasReachedMax = null,
    Object? hasError = null,
    Object? error = freezed,
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleQuickInfoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticlesLoadModelCopyWith<$Res>
    implements $ArticlesLoadModelCopyWith<$Res> {
  factory _$$_ArticlesLoadModelCopyWith(_$_ArticlesLoadModel value,
          $Res Function(_$_ArticlesLoadModel) then) =
      __$$_ArticlesLoadModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      int page,
      bool isLoading,
      bool hasReachedMax,
      bool hasError,
      Object? error,
      List<ArticleQuickInfoModel> articles});
}

/// @nodoc
class __$$_ArticlesLoadModelCopyWithImpl<$Res>
    extends _$ArticlesLoadModelCopyWithImpl<$Res, _$_ArticlesLoadModel>
    implements _$$_ArticlesLoadModelCopyWith<$Res> {
  __$$_ArticlesLoadModelCopyWithImpl(
      _$_ArticlesLoadModel _value, $Res Function(_$_ArticlesLoadModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? page = null,
    Object? isLoading = null,
    Object? hasReachedMax = null,
    Object? hasError = null,
    Object? error = freezed,
    Object? articles = null,
  }) {
    return _then(_$_ArticlesLoadModel(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleQuickInfoModel>,
    ));
  }
}

/// @nodoc

class _$_ArticlesLoadModel implements _ArticlesLoadModel {
  const _$_ArticlesLoadModel(
      {required this.type,
      this.page = 0,
      this.isLoading = false,
      this.hasReachedMax = false,
      this.hasError = false,
      this.error,
      final List<ArticleQuickInfoModel> articles = const []})
      : _articles = articles;

  @override
  final String type;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final bool hasError;
  @override
  final Object? error;
  final List<ArticleQuickInfoModel> _articles;
  @override
  @JsonKey()
  List<ArticleQuickInfoModel> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'ArticlesLoadModel(type: $type, page: $page, isLoading: $isLoading, hasReachedMax: $hasReachedMax, hasError: $hasError, error: $error, articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticlesLoadModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      page,
      isLoading,
      hasReachedMax,
      hasError,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticlesLoadModelCopyWith<_$_ArticlesLoadModel> get copyWith =>
      __$$_ArticlesLoadModelCopyWithImpl<_$_ArticlesLoadModel>(
          this, _$identity);
}

abstract class _ArticlesLoadModel implements ArticlesLoadModel {
  const factory _ArticlesLoadModel(
      {required final String type,
      final int page,
      final bool isLoading,
      final bool hasReachedMax,
      final bool hasError,
      final Object? error,
      final List<ArticleQuickInfoModel> articles}) = _$_ArticlesLoadModel;

  @override
  String get type;
  @override
  int get page;
  @override
  bool get isLoading;
  @override
  bool get hasReachedMax;
  @override
  bool get hasError;
  @override
  Object? get error;
  @override
  List<ArticleQuickInfoModel> get articles;
  @override
  @JsonKey(ignore: true)
  _$$_ArticlesLoadModelCopyWith<_$_ArticlesLoadModel> get copyWith =>
      throw _privateConstructorUsedError;
}
