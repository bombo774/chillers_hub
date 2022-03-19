import 'package:flutter/material.dart';

class MenuButtonModel {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  final int? totalNotification;

  MenuButtonModel({
    required this.activeIcon,
    required this.icon,
    required this.label,
    this.totalNotification,
  });
}
