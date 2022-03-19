import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid/responsive_grid.dart';

class TopEpisodeView extends GetView {
  const TopEpisodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kSpacing),
      width: double.maxFinite,
      // decoration: BoxDecoration(
      //   color: Theme.of(context).canvasColor,
      //   borderRadius: BorderRadius.circular(kBorderRadius),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "Top",
              style: GoogleFonts.poppinsTextTheme().headline6!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    fontSize: 16,
                  ),
              children: [
                TextSpan(
                  text: " | Episode",
                  style: GoogleFonts.poppinsTextTheme().headline6!.copyWith(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ),
          ResponsiveGridList(
              scroll: false,
              desiredItemWidth: 300,
              minSpacing: kSpacing,
              rowMainAxisAlignment: MainAxisAlignment.start,
              children: [
                1,
                2,
                3,
                4,
                5,
                6,
              ].map(
                (i) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        onTap: () {},
                        child: ListTile(
                          leading: Container(
                            color: Colors.black,
                            child: Image.network(
                              "https://i.ytimg.com/vi/mw6H6lCNWt4/mqdefault.jpg",
                              fit: BoxFit.cover,
                              width: 100,
                              height: 200,
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Episode 335 I City of Tswane Protests, Uber Eats,Female DJs,EFF, The Braai Show, Major  League DJz",
                                style: GoogleFonts.poppinsTextTheme()
                                    .caption!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.8,
                                      fontSize: 14,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Guest Name",
                                style: GoogleFonts.poppinsTextTheme()
                                    .caption!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.8,
                                      fontSize: 12,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Center(
                                    child: Icon(
                                      EvaIcons.playCircleOutline,
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .color,
                                      size: kIconSize - 5,
                                    ),
                                  ),
                                  const SizedBox(width: kContentSpacing),
                                  Text(
                                    "47:00 min",
                                    style: GoogleFonts.poppinsTextTheme()
                                        .caption!
                                        .copyWith(
                                          fontWeight: FontWeight.w100,
                                          color: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .color,
                                          fontSize: 10,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).toList())
        ],
      ),
    );
  }
}
