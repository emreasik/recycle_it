import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double get veryLowHeight => height * 0.005;
  double get lowHeight => height * 0.01;
  double get mediumHeight => height * 0.02;
  double get highHeight => height * 0.04;
  double get veryHeight => height * 0.1;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

extension ScaffoldExtension on BuildContext {
  dynamic showBottomSheet({Widget? child, VoidCallback? onClosed}) {
    return Scaffold.of(this)
        .showBottomSheet(
          (context) => child!,
          backgroundColor: Colors.transparent,
        )
        .closed
        .whenComplete(() {
      if (onClosed != null) {
        onClosed();
      }
    });
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get themeColor => Theme.of(this).colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingVeryLow => EdgeInsets.all(veryLowHeight);
  EdgeInsets get paddingLow => EdgeInsets.all(lowHeight);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumHeight);
  EdgeInsets get paddingHigh => EdgeInsets.all(highHeight);

  EdgeInsets get paddingHorizontalMedium => EdgeInsets.symmetric(horizontal: mediumHeight);
  EdgeInsets get paddingVerticalMedium => EdgeInsets.symmetric(vertical: highHeight);

  EdgeInsets get onlyRightPaddingMedium => EdgeInsets.only(right: mediumHeight);
  EdgeInsets get onlyTopPaddingVeryHigh => EdgeInsets.only(top: veryHeight);
  EdgeInsets get symetricPadding => EdgeInsets.symmetric(vertical: lowHeight, horizontal: highHeight);

  EdgeInsets get homesymetricPadding => EdgeInsets.symmetric(vertical: highHeight, horizontal: lowHeight);

  EdgeInsets get privateBottomBarPadding => const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
}

extension DurationExtension on BuildContext {
  Duration get normalDuration => const Duration(milliseconds: 500);
  Duration get longDuration => const Duration(milliseconds: 1000);
  Duration get snackBarDuration => const Duration(seconds: 5);
}
