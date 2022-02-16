import 'dart:math';
import 'dart:ui';

class DiceModuleColor {
  DiceModuleColor._();

  static const Color color1Light = Color.fromARGB(255, 245, 245, 235);
  static const Color color2Light = Color.fromARGB(255, 244, 232, 223);
  static const Color color3Light = Color.fromARGB(255, 238, 208, 202);
  static const Color color4Dark = Color.fromARGB(255, 217, 165, 155);
  static const Color color5Dark = Color.fromARGB(255, 107, 112, 110);
  static const Color color6Dark = Color.fromARGB(255, 194, 188, 195);
}

class ColorUtils {
  /// Get Random Color
  static Color getRandomColor() {
    return Color.fromARGB(
      255,
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
    );
  }
}
