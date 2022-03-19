import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid/responsive_grid.dart';

class TopChillersView extends GetView {
  const TopChillersView({Key? key}) : super(key: key);

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
                  text: " | Chiller",
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
          const SizedBox(height: kSpacing),
          ResponsiveGridList(
            scroll: false,
            squareCells: true,
            desiredItemWidth: 100,
            minSpacing: kSpacing,
            rowMainAxisAlignment: MainAxisAlignment.start,
            children: [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
            ].map(
              (i) {
                return Container(
                  alignment: const Alignment(0, 0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://images.pexels.com/photos/936119/pexels-photo-936119.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: kSpacing / 2),
                      Text(
                        "Katlego Mokala",
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
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }
}
