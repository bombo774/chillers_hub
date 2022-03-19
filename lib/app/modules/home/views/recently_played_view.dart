import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/model/recently_played_model.dart';
import 'package:chillers_hub/app/utils/responsive/device_responsive.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentlyPlayedView extends GetView {
  const RecentlyPlayedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpacing),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recently Played",
            style: GoogleFonts.poppinsTextTheme().headline6!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  fontSize: 16,
                ),
          ),
          const SizedBox(height: kSpacing),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recentlyPlayed.length,
            itemBuilder: (context, index) {
              final item = recentlyPlayed[index];
              return Container(
                margin: EdgeInsets.only(
                  bottom: index != recentlyPlayed.length - 1 ? 10 : 0,
                ),
                child: RecentlyPlayedItem(
                  image: item.image,
                  text: item.text,
                  title: item.title,
                  onTap: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RecentlyPlayedItem extends StatelessWidget {
  const RecentlyPlayedItem({
    Key? key,
    required this.title,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String image;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(kBorderRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppinsTextTheme().caption!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                        fontSize: 14,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: kContentSpacing / 2),
                Text(
                  text,
                  style: GoogleFonts.poppinsTextTheme().caption!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                        fontSize: 12,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            leading: Container(
              padding: const EdgeInsets.all(kSpacing / 4),
              decoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.onSecondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: Image.asset(image),
              ),
            ),
            trailing: DeviceResponsive.isDesktop(Get.context!)
                ? Text(
                    "3 mins",
                    style: GoogleFonts.poppinsTextTheme().caption!.copyWith(
                          fontWeight: FontWeight.w100,
                          color: Theme.of(context).textTheme.caption!.color,
                          fontSize: 10,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}
