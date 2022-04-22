import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

import '../../../core/core.dart';

class DesktopProjectsAppBar extends StatelessWidget {
  const DesktopProjectsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.1,
      padding: const EdgeInsets.symmetric(horizontal: 72.0),
      child: Row(
        children: [
          // app logo
          const AppLogo(),
          // spacing
          const Spacer(),
          // navigation items
          _buildNavigationItems(),
        ],
      ),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildNavigationItems() => GetBuilder<NavBarController>(builder: (NavBarController controller) {
        return Row(
          children: [
            // home
            _NavigationItem(
              title: '01.projects',
              isSelected: controller.projectsNavBarState == ProjectsNavBarState.projects,
              navKey: controller.allProjectsGlobalKey,
            ),
            // skills
            _NavigationItem(
              title: '02.experiments',
              isSelected: controller.projectsNavBarState == ProjectsNavBarState.experiments,
              navKey: controller.experimentsGlobalKey,
            ),
          ],
        );
      });
}

class _NavigationItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  final GlobalKey navKey;

  const _NavigationItem({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.navKey,
  }) : super(key: key);

  @override
  __NavigationItemState createState() => __NavigationItemState();
}

class __NavigationItemState extends State<_NavigationItem> {
  // state variables
  late bool isSelected;
  late double visibilityPercentage;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _NavigationItem oldWidget) {
    isSelected = widget.isSelected;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 64.0),
      child: GestureDetector(
        onTap: _onTap,
        child: MouseRegion(
          onEnter: (_) => setState(() => isSelected = true),
          onExit: (_) => setState(() => isSelected = widget.isSelected),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // nav bar title
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: textTheme.headline4!.copyWith(
                  color: isSelected ? AppTheme.secondaryColor : AppTheme.fontLightColor,
                ),
                child: Text(widget.title),
              ),
              // spacing
              const SizedBox(height: 4.0),
              // animated line
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutCubic,
                height: 3.0,
                width: isSelected ? 32.0 : 0.0,
                decoration: BoxDecoration(
                  color: AppTheme.ternaryColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Member Functions
  ///
  ///
  void _onTap() {
    if (widget.navKey.currentContext != null) {
      final RenderObject? renderObject = widget.navKey.currentContext?.findRenderObject();

      if (renderObject != null) {
        locator.get<NavBarController>().projectsScreenScrollController.position.ensureVisible(
              renderObject,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOutCubic,
            );
      }
    }
  }
}
