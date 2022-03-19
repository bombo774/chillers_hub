import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TODO remove and create view if still going to use this widget
class ChangePassword extends StatelessWidget {
  const ChangePassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  margin:
                      const EdgeInsets.only(left: kSpacing, right: kSpacing),
                  padding: const EdgeInsets.only(
                      left: kSpacing,
                      right: kSpacing,
                      top: kSpacing * 2,
                      bottom: kSpacing * 2),
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                    minHeight: 200,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          "Change Password",
                          style: GoogleFonts.poppins(
                            fontSize: kTitleFontSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: kSpacing),
                      Text(
                        "Password",
                        style: GoogleFonts.poppins(
                          color: Colors.white38,
                        ),
                      ),
                      const SizedBox(height: kContentSpacing),
                      // password
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
                          contentPadding: const EdgeInsets.only(
                              left: kSpacing, right: kSpacing),
                        ),
                        cursorColor: Colors.white,
                        cursorHeight: 20,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                        validator: (value) {},
                      ),
                      const SizedBox(
                        height: kSpacing,
                      ),
                      Text(
                        "Confirm Password",
                        style: GoogleFonts.poppins(
                          color: Colors.white38,
                        ),
                      ),
                      const SizedBox(height: kContentSpacing),
                      //confirm password
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          contentPadding: const EdgeInsets.only(
                              left: kSpacing, right: kSpacing),
                        ),
                        cursorColor: Colors.white,
                        cursorHeight: 20,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                        validator: (value) {},
                      ),
                      const SizedBox(height: kSpacing * 2),
                      //animations2 page transaction
                      SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Change Password",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                      // const SizedBox(height: kSpacing),
                      // Center(
                      //   child: Offstage(
                      //     offstage: !controller.changePasswordhasError.value,
                      //     child: RichText(
                      //       text: TextSpan(
                      //         text: "${controller.errorStatus} ",
                      //         style: const TextStyle(
                      //           color: Color.fromARGB(255, 224, 5, 5),
                      //           fontSize: 15,
                      //         ),
                      //         children: [
                      //           TextSpan(
                      //             text:
                      //                 "${controller.changePasswordErrorMessage}",
                      //             style: GoogleFonts.poppins(
                      //               color: const Color.fromARGB(255, 224, 5, 5),
                      //               fontSize: 15,
                      //             ),
                      //             mouseCursor:
                      //                 MaterialStateMouseCursor.clickable,
                      //             recognizer: TapGestureRecognizer()
                      //               ..onTap = () {},
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
