import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormLoginView extends GetView {
  const FormLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //greet
        SizedBox(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Welcome Back!",
                    style: GoogleFonts.poppins(
                      fontSize: kTitleFontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Happy to see you again",
                    style: GoogleFonts.poppins(
                      color: Colors.white38,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //form
        const SizedBox(height: kSpacing),
        //email
        Text(
          "Enter Email",
          style: GoogleFonts.poppins(
            color: Colors.white38,
          ),
        ),
        const SizedBox(height: kContentSpacing),
        //email text form feild
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (value) {},
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            fillColor: Colors.grey[800],
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kBorderRadius),
              ),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kBorderRadius),
              ),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kBorderRadius),
              ),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            contentPadding:
                const EdgeInsets.only(left: kSpacing, right: kSpacing),
          ),
          cursorColor: Colors.white,
          cursorHeight: 20,
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
          validator: (value) {},
        ),
        const SizedBox(height: kSpacing),
        //email
        Text(
          "Password",
          style: GoogleFonts.poppins(
            color: Colors.white38,
          ),
        ),
        const SizedBox(height: kContentSpacing),
        //password text form feild
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (value) {},
          decoration: InputDecoration(
            fillColor: Colors.grey[800],
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kBorderRadius),
              ),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kBorderRadius),
              ),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kBorderRadius),
              ),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: kSpacing),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: true
                      ? const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                ),
              ),
            ),
            contentPadding:
                const EdgeInsets.only(left: kSpacing, right: kSpacing),
          ),
          cursorColor: Colors.white,
          cursorHeight: 20,
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
          validator: (value) {
            //TODO
          },
        ),
        const SizedBox(height: kContentSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.raleway(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: kSpacing * 2),
        SizedBox(
          width: double.maxFinite,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.onTertiaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
              ),
              onPressed: () {
                Get.offNamed("/discover");
              },
              child: Text(
                "Login",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ),

        // const SizedBox(height: kSpacing),
        // Center(
        //   child: Offstage(
        //     offstage: !controller.hasError.value,
        //     child: RichText(
        //       text: TextSpan(
        //         text: "${controller.errorStatus} ",
        //         style: const TextStyle(
        //           color: Color.fromARGB(255, 224, 5, 5),
        //           fontSize: 15,
        //         ),
        //         children: [
        //           /* TextSpan(
        //               text: "Register",
        //               style: GoogleFonts.poppins(
        //                 color: const Color.fromARGB(186, 158, 194, 0),
        //                 fontSize: 15,
        //               ),
        //               mouseCursor: MaterialStateMouseCursor.clickable,
        //               recognizer: TapGestureRecognizer()..onTap = () {},
        //             ),
        //             const TextSpan(
        //               text: " or ",
        //               style: TextStyle(
        //                 color: Colors.white24,
        //                 fontSize: 15,
        //               ),
        //             ), */
        //           TextSpan(
        //             text: "${controller.errorMessage}",
        //             style: GoogleFonts.poppins(
        //               color: const Color.fromARGB(255, 224, 5, 5),
        //               fontSize: 15,
        //             ),
        //             mouseCursor: MaterialStateMouseCursor.clickable,
        //             recognizer: TapGestureRecognizer()..onTap = () {},
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
