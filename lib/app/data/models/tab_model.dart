import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TabViewItem extends Equatable {
  final Widget icon;
  final String label;
  final TabRoute route;

  const TabViewItem({
    required this.icon,
    required this.label,
    required this.route,
  });

  @override
  List<Object?> get props => [icon, label, route];

  factory TabViewItem.initial() =>
      const TabViewItem(icon: SizedBox(), label: '', route: TabRoute.feed);
}

enum TabRoute {
  feed,
  userProfile,
}
