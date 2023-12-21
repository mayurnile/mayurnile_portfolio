import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets.dart';

import '../../../core/core.dart';

class ProjectCardDesktop extends StatefulWidget {
  final Project project;
  final ProjectCardPosition position;

  const ProjectCardDesktop({
    super.key,
    required this.project,
    required this.position,
  });

  @override
  State<ProjectCardDesktop> createState() => _ProjectCardDesktopState();
}

class _ProjectCardDesktopState extends State<ProjectCardDesktop> {
  // data variables
  bool isHovered = false;
  late Offset widgetOffset;

  // animation variables
  static const Duration _animDuration = Duration(milliseconds: 600);
  static const Curve _animCurve = Curves.easeInOutCubic;

  // device variables
  late Size size;
  late TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    textTheme = Theme.of(context).textTheme;

    // calculating widget offset
    bool showLeft = false;
    switch (widget.position) {
      case ProjectCardPosition.center:
        widgetOffset = Offset.zero;
        showLeft = false;
        break;
      case ProjectCardPosition.left:
        widgetOffset = Offset(-size.width * 0.05, 0.0);
        showLeft = true;
        break;
      case ProjectCardPosition.right:
        widgetOffset = Offset(size.width * 0.05, 0.0);
        showLeft = false;
        break;
    }

    // calculating widget height
    double widgetHeight;

    if (size.height < DeviceBreakpoints.desktopHeight) {
      widgetHeight = size.height * 0.55;
    } else {
      widgetHeight = size.height * 0.42;
    }

    return SizedBox(
      height: widgetHeight,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // main visible content\
          if (showLeft)
            _buildVisibleContentLeft()
          else
            _buildVisibleContentRight(),
          // on hovered content
          _buildAppDescription(widgetHeight),
        ],
      ),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildVisibleContent(bool isLeft) => Transform.translate(
        offset: widgetOffset,
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: SizedBox(
            height: size.height * 0.42,
            width: size.width * 0.35,
            child: Stack(
              children: [
                // decorated border
                _buildDecorationBorder(),
                // image
                _buildImage(),
                // image opacity filter
                _buildImageFilters(),
                // colored image filter
                _buildColoredImageFilter(isLeft),
                // app details
                _buildAppDetails(),
              ],
            ),
          ),
        ),
      );

  Widget _buildVisibleContentRight() => AnimatedPositioned(
        duration: _animDuration,
        curve: _animCurve,
        left: isHovered ? size.width * 0.3 : size.width * 0.25,
        child: _buildVisibleContent(false),
      );

  Widget _buildVisibleContentLeft() => AnimatedPositioned(
        duration: _animDuration,
        curve: _animCurve,
        right: isHovered ? size.width * 0.3 : size.width * 0.25,
        child: _buildVisibleContent(true),
      );

  Widget _buildDecorationBorder() => Positioned(
        left: 18.0,
        top: 18.0,
        right: 0.0,
        bottom: 0.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: AppTheme.secondaryColor,
            ),
          ),
        ),
      );

  Widget _buildImage() => Positioned(
        left: 0.0,
        top: 0.0,
        right: 18.0,
        bottom: 18.0,
        child: Image.asset(
          widget.project.image,
          fit: BoxFit.cover,
        ),
      );

  Widget _buildImageFilters() => AnimatedPositioned(
        duration: _animDuration,
        curve: _animCurve,
        left: 0.0,
        top: 0.0,
        right: isHovered ? size.width * 0.35 : 18.0,
        bottom: 18.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppTheme.backgroundColor.withOpacity(0.7),
          ),
        ),
      );

  Widget _buildColoredImageFilter(bool isLeft) => AnimatedPositioned(
        duration: _animDuration,
        curve: _animCurve,
        left: 0.0,
        top: 0.0,
        right: isHovered ? 18.0 : size.width * 0.35,
        bottom: 18.0,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // technologies used
            Positioned(
              left: isLeft ? 22.0 : null,
              right: isLeft ? null : 22.0,
              bottom: 22.0,
              child: AnimatedOpacity(
                duration: _animDuration,
                opacity: isHovered ? 1.0 : 0.0,
                child: Row(
                  children: [
                    // flutter
                    _buildTechnologyIcon(IconAssets.flutter),
                    // spacing
                    const SizedBox(width: 12.0),
                    // dart
                    _buildTechnologyIcon(IconAssets.dart),
                    // spacing
                    const SizedBox(width: 12.0),
                    // firebase
                    _buildTechnologyIcon(IconAssets.firebase),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildTechnologyIcon(String icon) => Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.ternaryColor,
        ),
        child: SvgPicture.asset(
          icon,
          // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          color: Colors.white,
          height: 28.0,
          width: 28.0,
          fit: BoxFit.fitHeight,
        ),
      );

  Widget _buildAppDetails() => Positioned(
        left: size.width * 0.02,
        right: size.width * 0.1,
        bottom: size.height * 0.07,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app name
            AnimatedOpacity(
              duration: _animDuration,
              curve: _animCurve,
              opacity: isHovered ? 0.0 : 1.0,
              child: Text(
                widget.project.title,
                style: textTheme.displayMedium!
                    .copyWith(fontFamily: 'Josefin Sans'),
              ),
            ),
            // spacing
            const SizedBox(height: 8.0),
            // description
            AnimatedOpacity(
              duration: _animDuration,
              curve: _animCurve,
              opacity: isHovered ? 0.0 : 1.0,
              child: Text(
                widget.project.subtitle,
                style: textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      );

  Widget _buildAppDescription(double widgetHeight) {
    final Widget child = MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedOpacity(
        duration: _animDuration,
        opacity: isHovered ? 1.0 : 0.0,
        child: SizedBox(
          height: widgetHeight * 0.80,
          width: size.width * 0.25,
          child: Column(
            crossAxisAlignment: widget.position == ProjectCardPosition.left
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // project number
              Text(
                widget.project.projectNumber,
                style: textTheme.displaySmall!
                    .copyWith(color: AppTheme.ternaryColor),
              ),
              // spacing
              const SizedBox(height: 8.0),
              // project name
              Text(
                widget.project.title,
                style: textTheme.displaySmall!
                    .copyWith(fontFamily: 'Josefin Sans'),
              ),
              // project details
              Container(
                width: size.width * 0.25,
                margin: const EdgeInsets.symmetric(vertical: 12.0),
                padding: const EdgeInsets.all(12.0),
                color: AppTheme.secondaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.project.description
                      .map(
                        (String bulletPoint) => BulletPoint(text: bulletPoint),
                      )
                      .toList(),
                ),
              ),
              // store links
              AnimatedOpacity(
                duration: _animDuration,
                curve: _animCurve,
                opacity: isHovered ? 1.0 : 0.0,
                child: Row(
                  mainAxisAlignment: widget.position == ProjectCardPosition.left
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    // play store
                    if (widget.project.playStoreLink != null)
                      ElevatedButton(
                        onPressed: () =>
                            Utils.openURL(widget.project.playStoreLink!),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor),
                        child: const Text('Play Store'),
                      ),
                    // spacing
                    if (widget.project.playStoreLink != null)
                      const SizedBox(width: 16.0),
                    // app store
                    if (widget.project.appStoreLink != null)
                      ElevatedButton(
                        onPressed: () =>
                            Utils.openURL(widget.project.appStoreLink!),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.ternaryColor),
                        child: const Text('App Store'),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    switch (widget.position) {
      case ProjectCardPosition.center:
        return _buildAnimatedDescRight(child, false);
      case ProjectCardPosition.left:
        return _buildAnimatedDescLeft(child);
      case ProjectCardPosition.right:
        return _buildAnimatedDescRight(child, true);
    }
  }

  Widget _buildAnimatedDescRight(Widget child, bool displaceLess) =>
      AnimatedPositioned(
        duration: _animDuration,
        curve: _animCurve,
        left: isHovered
            ? displaceLess
                ? size.width * 0.13
                : size.width * 0.1
            : size.width * 0.15,
        child: child,
      );

  Widget _buildAnimatedDescLeft(Widget child) => AnimatedPositioned(
        duration: _animDuration,
        curve: _animCurve,
        right: isHovered ? size.width * 0.15 : size.width * 0.2,
        child: child,
      );
}
