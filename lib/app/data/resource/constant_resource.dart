//! SIZED BOX SPACING
import 'package:flutter/material.dart';
import 'package:superops/app/data/resource/color_resource.dart';

//! SIZED BOX SPACING
const SPACING_VVSMALL_HEIGHT = SizedBox(height: 4);
const SPACING_VSMALL_HEIGHT = SizedBox(height: 8);
const SPACING_SMALL_HEIGHT = SizedBox(height: 15);
const SPACING_MEDIUM_HEIGHT = SizedBox(height: 30);
const SPACING_LARGE_HEIGHT = SizedBox(height: 55);
const SPACING_VLARGE_HEIGHT_150 = SizedBox(height: 150);

const SPACING_VVSMALL_WIDTH = SizedBox(width: 4);
const SPACING_VSMALL_WIDTH = SizedBox(width: 8);
const SPACING_SMALL_WIDTH = SizedBox(width: 15);
const SPACING_MEDIUM_WIDTH = SizedBox(width: 30);
const SPACING_LARGE_WIDTH = SizedBox(width: 55);

const SHOW_NOTHING = SizedBox.shrink();
//! /////////////////////////////////////////////////////

const SPACER = Spacer();
const SPACER_F2 = Spacer(flex: 2);
const SPACER_F3 = Spacer(flex: 3);
const DIVIDER = Divider();

const double INFINITY = double.infinity;

const TextAlign CENTER_ALIGN = TextAlign.center;
const TextAlign LEFT_ALIGN = TextAlign.left;
const TextAlign RIGHT_ALIGN = TextAlign.end;

//! TEXT STYLE OMIT HARD-CODING
TextStyle? h1(BuildContext context) {
  return Theme.of(context).textTheme.displayLarge;
}

TextStyle? h2_light(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .displayMedium
      ?.copyWith(fontWeight: FontWeight.normal, color: APP_LIGHT_GREY);
}

TextStyle? h2_dark(BuildContext context) {
  return Theme.of(context).textTheme.displayMedium;
}

TextStyle? h3_light(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .displaySmall
      ?.copyWith(fontWeight: FontWeight.normal, color: BLACK);
}

TextStyle? h3_dark(BuildContext context) {
  return Theme.of(context).textTheme.displaySmall;
}

//? edge insets
const EdgeInsetsGeometry NO_PADDING = EdgeInsets.zero;
const EdgeInsets PAD_8 = EdgeInsets.all(8.0);
const EdgeInsets PAD_12 = EdgeInsets.all(12.0);
const EdgeInsets PAD_25 = EdgeInsets.all(25.0);
const EdgeInsets PAD_20 = EdgeInsets.all(20.0);

//? column and row alignment
const CrossAxisAlignment CROSS_AXIS_START = CrossAxisAlignment.start;
const CrossAxisAlignment CROSS_AXIS_CENTER = CrossAxisAlignment.center;
const CrossAxisAlignment CROSS_AXIS_END = CrossAxisAlignment.end;

const MainAxisAlignment MAIN_AXIS_START = MainAxisAlignment.start;
const MainAxisAlignment MAIN_AXIS_CENTER = MainAxisAlignment.center;
const MainAxisAlignment MAIN_AXIS_END = MainAxisAlignment.end;

const MAX = MainAxisSize.max;
const MIN = MainAxisSize.min;

//? alignment
const AlignmentGeometry B_CENTER = Alignment.bottomCenter;
const AlignmentGeometry CENTER = Alignment.center;
const Alignment C_TOP_LEFT = Alignment.topLeft;
const Alignment C_TOP_CENTER = Alignment.topCenter;
const Alignment C_TOP_RIGHT = Alignment.topRight;
const Alignment C_CENTER_LEFT = Alignment.centerLeft;
const Alignment C_CENTER_CENTER = Alignment.centerRight;
const Alignment C_CENTER_RIGHT = Alignment.center;
const Alignment C_BOTTOM_LEFT = Alignment.bottomLeft;
const Alignment C_BOTTOM_CENTER = Alignment.bottomCenter;
const Alignment C_BOTTOM_RIGHT = Alignment.bottomRight;

//? animation duration
final Duration FIVE_HUNDRED_MIL = Duration(microseconds: 500);
//! /////////////////////////////////////////////////