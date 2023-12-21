import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class ExperimentCardDesktop extends StatefulWidget {
  final Project project;

  const ExperimentCardDesktop({
    super.key,
    required this.project,
  });

  @override
  State<ExperimentCardDesktop> createState() => _ExperimentCardDesktopState();
}

class _ExperimentCardDesktopState extends State<ExperimentCardDesktop> {
  // control variables
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => Utils.openURL(widget.project.packageLink!),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutCubic,
          height: size.width * 0.14,
          width: size.width * 0.23,
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(bottom: 32.0),
          decoration: BoxDecoration(
            color: _isHovered ? AppTheme.secondaryColor.withOpacity(0.6) : Colors.transparent,
            border: Border.all(color: AppTheme.secondaryColor),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // package logo
              SvgPicture.asset(IconAssets.dart),
              // package type
              Text('Flutter Package', style: textTheme.titleMedium!.copyWith(fontFamily: 'Victor Mono')),
              // spacing
              const SizedBox(height: 12.0),
              // package title
              Text(
                widget.project.title,
                style: textTheme.headlineMedium,
              ),
              // spacing
              const SizedBox(height: 8.0),
              // package description
              Text(
                widget.project.subtitle,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
