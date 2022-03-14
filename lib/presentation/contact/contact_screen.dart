import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    TestimonialCardType testimonialCardType;
    TextStyle screenTitleStyle = textTheme.headline3!.copyWith(color: AppTheme.ternaryColor);

    if (size.width > DeviceBreakpoints.desktopWidth) {
      testimonialCardType = TestimonialCardType.desktop;
    } else if (size.width < DeviceBreakpoints.mobileWidth) {
      testimonialCardType = TestimonialCardType.mobile;
      screenTitleStyle = textTheme.headline5!.copyWith(
        color: AppTheme.ternaryColor,
        fontWeight: FontWeight.bold,
      );
    } else {
      testimonialCardType = TestimonialCardType.tablet;
      screenTitleStyle = textTheme.headline3!.copyWith(
        color: AppTheme.ternaryColor,
        fontWeight: FontWeight.bold,
      );
    }

    return VisibilityDetector(
      key: const ValueKey('/contact-desktop-view'),
      onVisibilityChanged: (visibilityInfo) {
        final double visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage > 25) {
          locator.get<NavBarController>().updateNavBarState(NavBarState.contact);
        }
      },
      child: Column(
        children: [
          // title
          Text(
            '<word on the street>',
            style: screenTitleStyle,
          ),
          // spacing
          _buildSpace(testimonialCardType),
          // testimonial section
          _buildTestimonialSection(testimonialCardType),
          // spacing
          SizedBox(height: size.height * 0.05),
          // testimonial actions
          _buildActionButtons(testimonialCardType),
          // spacing
          SizedBox(height: size.height * 0.15),
          // title
          Text(
            '<get in touch>',
            style: screenTitleStyle,
          ),
          // contact section
          _buildContactSection(size, textTheme, testimonialCardType),
          // social media section
          if (testimonialCardType != TestimonialCardType.desktop) _buildSocialMediaSection(size, textTheme),
          // website footer
          _buildWebsiteFooter(size, textTheme),
          // spacing
          SizedBox(height: size.height * 0.05),
        ],
      ),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildSpace(TestimonialCardType type) {
    switch (type) {
      case TestimonialCardType.mobile:
        return const SizedBox(height: 18.0);
      case TestimonialCardType.tablet:
        return const SizedBox(height: 36.0);
      case TestimonialCardType.desktop:
        return const SizedBox(height: 72.0);
    }
  }

  Widget _buildTestimonialSection(TestimonialCardType cardType) => LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          double maxWidth = constraints.maxWidth * 0.3;

          switch (cardType) {
            case TestimonialCardType.mobile:
              maxWidth = constraints.maxWidth * 0.8;
              break;
            case TestimonialCardType.tablet:
              maxWidth = constraints.maxWidth * 0.55;
              break;
            case TestimonialCardType.desktop:
              maxWidth = constraints.maxWidth * 0.3;
              break;
          }

          return SizedBox(
            width: constraints.maxWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // testimonial
                TestimonialCard(
                  testimonial:
                      "Flawless designing when it comes to front end, skilled coder, easy to communicate with, quick learner, creative thinker. Pleasure working with Mayur !",
                  givenBy: "Aditya Charan",
                  companyName: "Smart Spider",
                  cardWidth: maxWidth,
                  type: cardType,
                ),
              ],
            ),
          );
        },
      );

  Widget _buildActionButtons(TestimonialCardType type) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // left arrow
          AppIconButton(
            isFilled: false,
            icon: SvgPicture.asset(IconAssets.arrowBack),
            onPressed: () {},
            color: AppTheme.secondaryColor,
            isSmall: type != TestimonialCardType.desktop,
          ),
          //  desktop spacing
          if (type == TestimonialCardType.desktop) const SizedBox(width: 42.0),
          // other spacing
          if (type != TestimonialCardType.desktop) const SizedBox(width: 18.0),
          // right arrow
          AppIconButton(
            isFilled: true,
            icon: SvgPicture.asset(IconAssets.arrowForward),
            onPressed: () {},
            color: AppTheme.ternaryColor,
            isSmall: type != TestimonialCardType.desktop,
          ),
        ],
      );

  Widget _buildContactSection(Size size, TextTheme textTheme, TestimonialCardType type) {
    double textSize = size.width * 0.4;
    switch (type) {
      case TestimonialCardType.mobile:
        textSize = size.width * 0.7;
        break;
      case TestimonialCardType.tablet:
        textSize = size.width * 0.8;
        break;
      case TestimonialCardType.desktop:
        textSize = size.width * 0.4;
        break;
    }

    return Column(
      children: [
        // spacing
        const SizedBox(height: 32.0),
        // sub title
        SizedBox(
          width: textSize,
          child: Text(
            "Although I'm not currently looking for any new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
            style: type == TestimonialCardType.mobile ? textTheme.bodyText2 : textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        // spacing
        const SizedBox(height: 42.0),
        // say hi button
        AppButton(
          onPressed: () {},
          borderColor: AppTheme.ternaryColor,
          title: 'Say Hi!',
          isSmall: type == TestimonialCardType.mobile,
        ),
        // spacing
        SizedBox(height: type == TestimonialCardType.desktop ? size.height * 0.2 : size.height * 0.05),
      ],
    );
  }

  Widget _buildSocialMediaSection(Size size, TextTheme textTheme) => Column(
        children: [
          // subtitle text
          Text(
            'or connect using',
            style: textTheme.headline6,
          ),
          // spacing
          const SizedBox(height: 32.0),
          // social media icons
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // github
              SocialLinkButton(
                icon: IconAssets.github,
                type: SocialLinkType.github,
                launchURL: Urls.githubLink,
                defaultColor: AppTheme.fontDarkColor,
              ),
              // spacing
              SizedBox(width: 18.0),
              // linkedin
              SocialLinkButton(
                icon: IconAssets.linkedin,
                type: SocialLinkType.linkedin,
                launchURL: Urls.linkedinLink,
                defaultColor: AppTheme.fontDarkColor,
              ),
              // spacing
              SizedBox(width: 18.0),
              // discord
              SocialLinkButton(
                icon: IconAssets.discord,
                type: SocialLinkType.discord,
                launchURL: Urls.discordLink,
                defaultColor: AppTheme.fontDarkColor,
              ),
            ],
          ),
          // spacing
          SizedBox(height: size.height * 0.2),
        ],
      );

  Widget _buildWebsiteFooter(Size size, TextTheme textTheme) {
    if (size.width > DeviceBreakpoints.tabletWidth) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // left part
            Text(
              "Designed & Developed by Mayur Nile",
              style: textTheme.bodyText2!.copyWith(fontFamily: 'Victor Mono'),
            ),
            // right part
            Text(
              "Built with Flutter 💙",
              style: textTheme.bodyText2!.copyWith(fontFamily: 'Victor Mono'),
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          // top part
          Text(
            "Designed & Developed by Mayur Nile",
            style: textTheme.bodyText2!.copyWith(fontFamily: 'Victor Mono'),
          ),
          // spacing
          const SizedBox(height: 12.0),
          // bottom part
          Text(
            "Built with Flutter 💙",
            style: textTheme.bodyText2!.copyWith(fontFamily: 'Victor Mono'),
          ),
        ],
      );
    }
  }
}
