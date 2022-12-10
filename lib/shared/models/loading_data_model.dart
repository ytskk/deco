import 'package:flutter/material.dart';

@immutable
class LoadingDataModel<T> {
  const LoadingDataModel({
    T? data,
    this.isLoading = false,
    this.hasError = false,
    this.hasReachedMax = false,
    T? defaultValue,
  }) : data = data ?? defaultValue;

  final T? data;
  final bool isLoading;
  final bool hasError;
  final bool hasReachedMax;

  LoadingDataModel<T> copyWith({
    T? data,
    bool? isLoading,
    bool? hasError,
  }) {
    return LoadingDataModel<T>(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoadingDataModel<T> &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          isLoading == other.isLoading &&
          hasError == other.hasError;

  @override
  int get hashCode => data.hashCode ^ isLoading.hashCode ^ hasError.hashCode;
}
