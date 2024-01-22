import 'dart:async';
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

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _init() async {
    try {
      value = value.copyWith(isLoading: true);
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (value.remainingTime == 0) {
          timer.cancel();
        } else {
          value = value.copyWith(remainingTime: value.remainingTime - 1);
        }
      });
      List<Resource> resources = [];
      for (var resourceQuery in Constants.reourseQueries) {
        final resource =
            await _resourcesApiService.getResource(resourceQuery).timeout(
          const Duration(minutes: 1),
          onTimeout: () {
            _timer?.cancel();
            throw TimeoutException('timeout');
          },
        );
        resources.add(resource);
      }
      value = value.copyWith(isLoading: false, resources: resources);
      _timer?.cancel();
    } catch (e) {
      _timer?.cancel();
      if (e is TimeoutException) {
        value = value.copyWith(
          isLoading: false,
          isTimeout: true,
        );
      } else {
        value = value.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        );
      }
    }
  }

  void refresh() => _init();
}

class ResourcesState {
  final List<Resource> resources;
  final bool isLoading;
  final int remainingTime;
  final String? errorMessage;
  final bool isTimeout;
  const ResourcesState({
    required this.resources,
    required this.isLoading,
    this.errorMessage,
    required this.remainingTime,
    this.isTimeout = false,
  });

  factory ResourcesState.initial() => ResourcesState(
        resources: [],
        isLoading: false,
        remainingTime: 60,
      );

  ResourcesState copyWith({
    bool? isLoading,
    List<Resource>? resources,
    String? errorMessage,
    int? remainingTime,
    bool? isTimeout,
  }) =>
      ResourcesState(
        resources: resources ?? this.resources,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        remainingTime: remainingTime ?? this.remainingTime,
        isTimeout: isTimeout ?? this.isTimeout,
      );
}
