// Flutter imports:
import 'package:flutter/material.dart';

double tabletSize = 767;
double largeTablet = 965;
double desktopSize = 1240;
double mediumDesktopSize = 1780;
double largeDesktopSize = 1780;
double mobileSize = 480;

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceMassive = SizedBox(height: 120.0);

Widget spacedDivider = Column(
  children: const <Widget>[
    verticalSpaceSmall,
    Divider(),
    verticalSpaceSmall,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

/// Returns screen width
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

/// Returns screen height
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

/// Returns screen orientation
bool isLandscape(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.landscape;
