import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/model/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key, required this.data, required this.onPresseed})
      : super(key: key);
  final UserProfileModel data;
  final Function() onPresseed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kContentSpacing),
      child: Material(
        borderRadius: BorderRadius.circular(kBorderRadius),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(kBorderRadius),
          onTap: onPresseed,
          child: Padding(
            padding: const EdgeInsets.all(kContentSpacing),
            child: Row(
              children: [
                _buildImage(context),
                const SizedBox(width: kContentSpacing),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildName(context),
                      _buildUserType(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: data.image,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              shape: BoxShape.circle,
            ),
            child: Icon(
              UniconsLine.shield_plus,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildName(context) {
    return Text(
      data.name,
      style: GoogleFonts.poppinsTextTheme().headline6!.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildUserType(context) {
    return Text(
      data.userType,
      style: GoogleFonts.poppinsTextTheme().caption!.copyWith(
            fontWeight: FontWeight.w300,
            color: Theme.of(context).textTheme.caption!.color,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
