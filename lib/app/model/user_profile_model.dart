import 'package:flutter/cupertino.dart';

class UserProfileModel {
  final ImageProvider image;
  final String name;
  final String userType;

  UserProfileModel(
      {required this.image, required this.name, required this.userType});
}
