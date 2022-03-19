import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginInfoView extends GetView {
  const LoginInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'C-Way\nSign in',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "If you don't have an account \nor your account is disabled or blocked",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Text(
              "Contact your ",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Text(
                  "supervisor ",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
            Text(
              "for assistance",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ],
    );
  }
}
