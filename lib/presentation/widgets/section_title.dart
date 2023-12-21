// import 'package:flutter/material.dart';

// import '../../core/core.dart';

// // class SectionTitle extends StatelessWidget {
// //   final String title;

// //   const SectionTitle({required this.title, super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final TextTheme textTheme = Theme.of(context).textTheme;

// //     return GetBuilder<NavBarController>(
// //       builder: (controller) {
// //         final double scrollOffset = controller.landingScreenScrollController.offset;
// //         final double letterSpacing = scrollOffset;
// //         print(letterSpacing);
// //         return AnimatedDefaultTextStyle(
// //           duration: const Duration(milliseconds: 300),
// //           style: textTheme.displaySmall!.copyWith(
// //             color: AppTheme.ternaryColor,
// //             letterSpacing: letterSpacing,
// //           ),
// //           child: Text(title),
// //         );
// //       },
// //     );
// //   }
// // }

// class SectionTitle extends StatefulWidget {
//   final String title;
//   final int index;
//   final TextStyle? style;

//   const SectionTitle({
//     required this.title,
//     required this.index,
//     this.style,
//     super.key,
//   });

//   @override
//   _SectionTitleState createState() => _SectionTitleState();
// }

// class _SectionTitleState extends State<SectionTitle> {
//   late ScrollController _scrollController;
//   double _letterSpacing = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = locator.get<NavBarController>().landingScreenScrollController;
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     super.dispose();
//   }

//   void _onScroll() {
//     setState(() {
//       // Calculate the letter spacing based on the current scroll offset
//       _letterSpacing = _scrollController.offset / (120.0 * (widget.index + 1));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;
//     return AnimatedBuilder(
//       animation: _scrollController,
//       builder: (context, child) {
//         return Text(
//           widget.title,
//           style: widget.style == null
//               ? textTheme.displaySmall!.copyWith(
//                   color: AppTheme.ternaryColor,
//                   letterSpacing: _letterSpacing,
//                 )
//               : widget.style!.copyWith(
//                   letterSpacing: _letterSpacing,
//                 ),
//         );
//       },
//     );
//   }
// }
