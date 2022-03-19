import 'package:flutter/cupertino.dart';
import 'package:unicons/unicons.dart';

class NavigationItemModel {
  final IconData icon;

  NavigationItemModel({required this.icon});
}

List<NavigationItemModel> navItems = [
  NavigationItemModel(icon: UniconsLine.home),
  NavigationItemModel(icon: UniconsLine.shopping_cart),
  NavigationItemModel(icon: UniconsLine.heart),
  NavigationItemModel(icon: UniconsLine.video),
  NavigationItemModel(icon: UniconsLine.music),
  NavigationItemModel(icon: UniconsLine.ticket),
  NavigationItemModel(icon: UniconsLine.shop),
  NavigationItemModel(icon: UniconsLine.cloud_question),
  NavigationItemModel(icon: UniconsLine.setting),
];
