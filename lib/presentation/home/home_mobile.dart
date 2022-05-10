import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: AnimationConfig.columnToAnimatedList(
            children: [
              // title
              Text(
                '<hello there>',
                style: textTheme.headline5!.copyWith(
                  color: AppTheme.ternaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // spacing
              const SizedBox(height: 16.0),
              // heading
              Text(
                "I'm Mayur Nile.",
                style: textTheme.headline3!.copyWith(fontFamily: 'Josefin Sans'),
              ),
              // spacing
              const SizedBox(height: 8.0),
              // sub-heading
              SizedBox(
                // width: size.width * 0.7,
                child: Text(
                  'I build meaningful mobile apps.',
                  style: textTheme.headline3!.copyWith(color: AppTheme.fontLightColor, fontFamily: 'Josefin Sans'),
                ),
              ),
              // spacing
              const SizedBox(height: 12.0),
              // body
              SizedBox(
                // width: size.width * 0.5,
                child: Text.rich(
                  TextSpan(
                    text:
                        "     I'm a software engineer specializing in building (and occasionally designing) exceptional flutter applications. Currently, I'm focused on building accessible, marketing and productivity apps at ",
                    children: [
                      TextSpan(
                        text: "Digital Trons",
                        style: textTheme.bodyText2!.copyWith(color: AppTheme.ternaryColor),
                      ),
                      const TextSpan(text: "."),
                    ],
                  ),
                  style: textTheme.bodyText2,
                ),
              ),
              // spacing
              const SizedBox(height: 22.0),
              // download resume button
              AppButton(
                onPressed: () => Utils.openURL(Urls.resumeLink),
                borderColor: AppTheme.secondaryColor,
                title: 'Download Resume',
                isSmall: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
