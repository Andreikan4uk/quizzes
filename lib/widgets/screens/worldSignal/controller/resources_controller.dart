import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/models/resource.dart';
import 'package:quiz_app/services/resources_api_service.dart';

class ResourcesController extends ValueNotifier<ResourcesState> {
  ResourcesController() : super(ResourcesState.initial()) {
    _init();
  }
  final _resourcesApiService = GetIt.instance<ResourcesApiService>();

  Future<void> _init() async {
    try {
      value = value.copyWith(isLoading: true);
      List<Resource> resources = [];
      for (var resourceQuery in Constants.reourseQueries) {
        final resource = await _resourcesApiService.getResource(resourceQuery);
        resources.add(resource);
      }
      value = value.copyWith(isLoading: false, resources: resources);
    } catch (e) {
      log(e.toString());
      value = value.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void refresh() => _init();
}

class ResourcesState {
  final List<Resource> resources;
  final bool isLoading;
  final String? errorMessage;
  const ResourcesState({
    required this.resources,
    required this.isLoading,
    this.errorMessage,
  });

  factory ResourcesState.initial() => ResourcesState(
        resources: [],
        isLoading: false,
      );

  ResourcesState copyWith({
    bool? isLoading,
    List<Resource>? resources,
    String? errorMessage,
  }) =>
      ResourcesState(
        resources: resources ?? this.resources,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
