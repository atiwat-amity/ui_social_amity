import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/tab_model.dart';

class TabViewModelState extends Equatable {
  final int currentIndex;
  final TabViewItem current;
  const TabViewModelState({
    required this.currentIndex,
    required this.current,
  });

  @override
  List<Object?> get props => [currentIndex, current];

  @override
  bool get stringify => true;

  factory TabViewModelState.initial() {
    return TabViewModelState(
      currentIndex: 0,
      current: TabViewItem.initial(),
    );
  }

  TabViewModelState copyWith({
    int? currentIndex,
    TabViewItem? current,
  }) {
    return TabViewModelState(
      currentIndex: currentIndex ?? this.currentIndex,
      current: current ?? this.current,
    );
  }
}

class TabViewModel with ChangeNotifier {
  TabViewModelState _state = TabViewModelState.initial();
  TabViewModelState get state => _state;

  final items = const <TabViewItem>[
    TabViewItem(
      icon: Icon(Icons.home),
      label: 'FEED',
      route: TabRoute.feed,
    ),
    TabViewItem(
      icon: Icon(Icons.menu),
      label: 'Edit',
      route: TabRoute.editCommunity,
    ),
    TabViewItem(
      icon: Icon(Icons.person),
      label: 'Profile',
      route: TabRoute.userProfile,
    ),
  ];

  void selectTab(int index) {
    _state = _state.copyWith(
      currentIndex: index,
      current: items[index],
    );
    notifyListeners();
  }
}
