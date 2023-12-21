import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.only(left: size.width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: AnimationConfig.columnToAnimatedList(
            children: [
              // title
              SizedBox(
                width: size.width * 0.2,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '<hello there>',
                    style: textTheme.displaySmall!.copyWith(color: AppTheme.ternaryColor),
                  ),
                ),
              ),
              // spacing
              const SizedBox(height: 22.0),
              // heading
              SizedBox(
                width: size.width * 0.5,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "I'm Mayur Nile.",
                    style: textTheme.displayLarge,
                  ),
                ),
              ),
              // spacing
              const SizedBox(height: 18.0),
              // sub-heading
              SizedBox(
                width: size.width * 0.7,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'I build meaningful mobile apps.',
                    style: textTheme.displayLarge!.copyWith(color: AppTheme.fontLightColor),
                  ),
                ),
              ),
              // spacing
              const SizedBox(height: 18.0),
              // body
              SizedBox(
                width: size.width * 0.6,
                child: AutoSizeText.rich(
                  TextSpan(
                    text:
                        "     I'm a software engineer specializing in building (and occasionally designing) exceptional flutter applications. Currently, I'm focused on building accessible, marketing and productivity apps at ",
                    children: [
                      TextSpan(
                       text: "Grappus",
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Utils.openURL(Urls.currentCompanyLink),
                        style: textTheme.bodyLarge!.copyWith(color: AppTheme.ternaryColor),
                      ),
                      const TextSpan(text: "."),
                    ],
                  ),
                  style: textTheme.bodyLarge,
                  maxLines: 5,
                ),
              ),
              // spacing
              const SizedBox(height: 22.0),
              // download resume button
              AppButton(
                onPressed: () => Utils.openURL(Urls.resumeLink),
                borderColor: AppTheme.secondaryColor,
                title: 'Download Resume',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
