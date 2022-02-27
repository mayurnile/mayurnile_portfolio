import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({Key? key}) : super(key: key);

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
          SvgPicture.asset(IconAssets.appLogo),
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
  Widget _buildNavigationItems() => Row(
        children: const [
          // home
          _NavigationItem(title: '01.home', isSelected: true),
          // skills
          _NavigationItem(title: '02.skills', isSelected: false),
          // my work
          _NavigationItem(title: '03.my work', isSelected: false),
          // contact
          _NavigationItem(title: '04.contact', isSelected: false),
        ],
      );
}

class _NavigationItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  const _NavigationItem({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  __NavigationItemState createState() => __NavigationItemState();
}

class __NavigationItemState extends State<_NavigationItem> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 64.0),
      child: Text(
        widget.title,
        style: textTheme.headline4!.copyWith(
          color: widget.isSelected ? AppTheme.secondaryColor : AppTheme.fontLightColor,
        ),
      ),
    );
  }
}
