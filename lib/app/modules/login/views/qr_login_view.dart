import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrLoginView extends GetView {
  const QrLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            child: QrImage(
              data: "1234567",
              version: QrVersions.auto,
              size: 160,
              gapless: false,
              embeddedImage:
                  const AssetImage('assets/images/app-icon-64-i.png'),
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: const Size(50, 50),
              ),
            ),
          ),
          // if (controller.isLoading.value)
          //   const SizedBox(
          //     height: 160,
          //     width: 160,
          //     child: SpinKitFadingFour(
          //       size: 160,
          //       color: Colors.white24,
          //     ),
          //   ),
          const SizedBox(height: kSpacing),
          Column(
            children: [
              RichText(
                text: TextSpan(
                  text: "Sign in with QR Code",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: kTitleFontSize,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: kContentSpacing),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Scan this with the ",
                  style: GoogleFonts.poppins(
                    color: Colors.white38,
                  ),
                  children: [
                    TextSpan(
                      text: "Chillers hub mobile app ",
                      style: GoogleFonts.poppins(
                        color: Colors.white38,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: "to sign in instantly",
                      style: GoogleFonts.poppins(
                        color: Colors.white38,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
