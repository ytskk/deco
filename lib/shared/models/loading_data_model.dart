import 'package:flutter/material.dart';

@immutable
class LoadingDataModel<T> {
  const LoadingDataModel({
    T? data,
    this.isLoading = false,
    this.hasReachedMax = false,
    T? defaultValue,
    this.error,
  }) : data = data ?? defaultValue;

  final T? data;
  final bool isLoading;
  final bool hasReachedMax;
  final Object? error;

  bool get hasError => error != null;

  LoadingDataModel<T> copyWith({
    T? data,
    bool? isLoading,
    bool? hasError,
    Object? error,
  }) {
    return LoadingDataModel<T>(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoadingDataModel<T> &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          isLoading == other.isLoading &&
          error == other.error;

  @override
  int get hashCode => data.hashCode ^ isLoading.hashCode ^ error.hashCode;
}
