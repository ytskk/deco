import 'dart:developer';

import 'package:dev_community/api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientApiProvider = Provider<Dio>((ref) {
  log('creating client api provider');
  return ClientApi.dioWithInterceptors;
});
