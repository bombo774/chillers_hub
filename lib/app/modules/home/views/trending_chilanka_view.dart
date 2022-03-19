import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/modules/home/controllers/top_chilla_and_trending_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class TrendingChilankaView extends GetView {
  const TrendingChilankaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpacing),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: GetBuilder<TopChillaAndTrendingController>(
        init: TopChillaAndTrendingController(),
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trending Chilanka",
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
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Material(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(kContentSpacing),
                      margin: EdgeInsets.only(
                          bottom: index != 1 ? 10 : 0,
                          top: index != 1 ? 10 : 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kBorderRadius),
                                  ),
                                  child: Text(
                                    "Vusi Thembekwayo",
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
                                ),
                              ),
                              const SizedBox(width: kSpacing),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                ),
                                child: Text(
                                  "Live",
                                  style: GoogleFonts.poppinsTextTheme()
                                      .labelLarge!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                              //title
                            ],
                          ),
                          const SizedBox(height: kSpacing),
                          Center(
                            child: Stack(
                              children: [
                                //background
                                SizedBox(
                                  width: double.maxFinite,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(kBorderRadius),
                                    child: Image.asset(
                                      "assets/images/mqdefault_6s-10.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                //join
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(
                                          kBorderRadius,
                                        ),
                                        topLeft: Radius.circular(
                                          kBorderRadius,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          UniconsLine.video,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //unmute
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                          kBorderRadius,
                                        ),
                                        topRight: Radius.circular(
                                          kBorderRadius,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          UniconsLine.volume_mute,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
