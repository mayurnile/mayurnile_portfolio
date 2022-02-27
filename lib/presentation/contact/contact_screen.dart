import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        // title
        Text(
          '<some deeds regarding my work>',
          style: textTheme.headline3!.copyWith(color: AppTheme.ternaryColor),
        ),
        // spacing
        const SizedBox(height: 72.0),
        // testimonial section
        _buildTestimonialSection(size, textTheme),
        // spacing
        SizedBox(height: size.height * 0.1),
        // title
        Text(
          '<get in touch>',
          style: textTheme.headline3!.copyWith(color: AppTheme.ternaryColor),
        ),
        // contact section
        _buildContactSection(size, textTheme),
        // website footer
        _buildWebsiteFooter(textTheme),
        // spacing
        SizedBox(height: size.height * 0.05),
      ],
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildTestimonialSection(Size size, TextTheme textTheme) => LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // left testimonial
                TestimonialCard(
                  testimonial:
                      "“Flawless designing when it comes to front end, skilled coder, easy to communicate with, quick learner, creative thinker. Pleasure working with Mayur”",
                  givenBy: "Aditya Charan",
                  companyName: "Smart Spider",
                  cardWidth: constraints.maxWidth * 0.25,
                ),
                // center testimonial
                TestimonialCard(
                  testimonial:
                      "“Flawless designing when it comes to front end, skilled coder, easy to communicate with, quick learner, creative thinker. Pleasure working with Mayur”",
                  givenBy: "Aditya Charan",
                  companyName: "Smart Spider",
                  cardWidth: constraints.maxWidth * 0.25,
                  showSwitch: true,
                ),
                // right testimonial
                TestimonialCard(
                  testimonial:
                      "“Flawless designing when it comes to front end, skilled coder, easy to communicate with, quick learner, creative thinker. Pleasure working with Mayur”",
                  givenBy: "Aditya Charan",
                  companyName: "Smart Spider",
                  cardWidth: constraints.maxWidth * 0.25,
                ),
              ],
            ),
          );
        },
      );

  Widget _buildContactSection(Size size, TextTheme textTheme) => Column(
        children: [
          // spacing
          const SizedBox(height: 32.0),
          // sub title
          SizedBox(
            width: size.width * 0.4,
            child: Text(
              "Although I'm not currently looking for any new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
              style: textTheme.bodyText1,
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
          ),
          // spacing
          SizedBox(height: size.height * 0.2),
        ],
      );

  Widget _buildWebsiteFooter(TextTheme textTheme) => Padding(
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
}
