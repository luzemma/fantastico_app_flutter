import 'package:flutter/material.dart';

class ColorHelper {
  static Color hexToColor(String hex) {
    assert(
      RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa',
    );

    return Color(
      int.parse(hex.substring(1), radix: 16) +
          (hex.length == 7 ? 0xff000000 : 0x00000000),
    );
  }

  static Color get primaryBlue => hexToColor('#27BCD9');

  static Color get secondaryBlue => hexToColor('#72E7E8');

  static Color get darkGray => hexToColor('#21272E');

  static Color get lightGray => hexToColor('#8E98A5');

  static Color get fourCatsOrange => hexToColor('#E99218');

  static Color get mcqueenRed => hexToColor('#D73B2F');

  static Color get foggyGray => hexToColor('#E7EAED');

  static Color get shakyGreen => hexToColor('#78AE41');

  static Color get forgotRed => hexToColor('#D7433B');

  static Color get okComputerBlue => hexToColor('#52A9FF');
}
