import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    TestimonialCardType testimonialCardType;
    MyPhotoType myPhotoType;
    TextStyle screenTitleStyle =
        textTheme.displaySmall!.copyWith(color: AppTheme.ternaryColor);

    if (size.width > DeviceBreakpoints.desktopWidth) {
      testimonialCardType = TestimonialCardType.desktop;
      myPhotoType = MyPhotoType.desktop;
    } else if (size.width < DeviceBreakpoints.mobileWidth) {
      testimonialCardType = TestimonialCardType.mobile;
      myPhotoType = MyPhotoType.mobile;
      screenTitleStyle = textTheme.headlineSmall!.copyWith(
        color: AppTheme.ternaryColor,
        fontWeight: FontWeight.bold,
      );
    } else {
      testimonialCardType = TestimonialCardType.tablet;
      myPhotoType = MyPhotoType.tablet;
      screenTitleStyle = textTheme.displaySmall!.copyWith(
        color: AppTheme.ternaryColor,
        fontWeight: FontWeight.bold,
      );
    }

    return VisibilityDetector(
      key: const ValueKey('/contact-desktop-view'),
      onVisibilityChanged: (visibilityInfo) {
        final double visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage > 25) {
          locator
              .get<NavBarController>()
              .updateNavBarState(NavBarState.contact);
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
          TestimonialSection(cardType: testimonialCardType),
          // spacing
          SizedBox(height: size.height * 0.15),
          // title
          Text(
            '<get in touch>',
            style: screenTitleStyle,
          ),
          // contact section
          _buildContactSection(
              size, textTheme, testimonialCardType, myPhotoType),
          // social media section
          if (testimonialCardType != TestimonialCardType.desktop)
            _buildSocialMediaSection(size, textTheme),
          // website footer
          const WebsiteFooter(),
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

  Widget _buildContactSection(
    Size size,
    TextTheme textTheme,
    TestimonialCardType type,
    MyPhotoType photoType,
  ) {
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
        // my photo
        // MyPhoto(type: photoType),
        // spacing
        // const SizedBox(height: 48.0),
        // sub title
        SizedBox(
          width: textSize,
          child: Text(
            "Although I'm not currently looking for any new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
            style: type == TestimonialCardType.mobile
                ? textTheme.bodyMedium
                : textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        // spacing
        const SizedBox(height: 42.0),
        // say hi button
        AppButton(
          onPressed: () => Utils.sendEmail(),
          borderColor: AppTheme.ternaryColor,
          title: 'Say Hi!',
          isSmall: type == TestimonialCardType.mobile,
        ),
        // spacing
        SizedBox(
            height: type == TestimonialCardType.desktop
                ? size.height * 0.2
                : size.height * 0.05),
      ],
    );
  }

  Widget _buildSocialMediaSection(Size size, TextTheme textTheme) => Column(
        children: [
          // subtitle text
          Text(
            'or connect using',
            style: textTheme.titleLarge,
          ),
          // spacing
          const SizedBox(height: 32.0),
          // social media icons
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // github
              SocialLinkButton(
                icon: IconAssets.github,
                launchURL: Urls.githubLink,
                defaultColor: AppTheme.fontDarkColor,
              ),
              // spacing
              SizedBox(width: 18.0),
              // linkedin
              SocialLinkButton(
                icon: IconAssets.linkedin,
                launchURL: Urls.linkedinLink,
                defaultColor: AppTheme.fontDarkColor,
              ),
              // spacing
              SizedBox(width: 18.0),
              // instagram
              SocialLinkButton(
                icon: IconAssets.instagram,
                launchURL: Urls.instagramLink,
                defaultColor: AppTheme.fontDarkColor,
              ),
            ],
          ),
          // spacing
          SizedBox(height: size.height * 0.2),
        ],
      );
}
