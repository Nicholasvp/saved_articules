import 'package:flutter/material.dart';

class CustomTheme {
  static const title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const bodySmall = TextStyle(
    fontSize: 14,
  );
  static const bodyTiny = TextStyle(
    fontSize: 14,
  );
  static const label = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
  static const labelStrong = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  //button
  static final buttomWhite = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    padding: const EdgeInsets.all(24),
    side: const BorderSide(color: Colors.red, width: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  static final buttomBlack = ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    padding: const EdgeInsets.all(24),
    side: const BorderSide(color: Colors.black, width: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  static final buttomRed = ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    padding: const EdgeInsets.all(16),
    side: const BorderSide(color: Colors.red, width: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
