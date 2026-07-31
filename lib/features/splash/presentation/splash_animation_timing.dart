class SplashAnimationTiming {
  const SplashAnimationTiming._();

  static const initialDelay = Duration(milliseconds: 80);
  static const letterDuration = Duration(milliseconds: 420);
  static const letterStagger = Duration(milliseconds: 140);
  static const iconGap = Duration.zero;
  static const iconDuration = Duration(milliseconds: 430);
  static const holdDuration = Duration(milliseconds: 400);
  static const expansionDuration = Duration(milliseconds: 700);
  static const navigationGap = Duration(milliseconds: 80);

  static Duration letterDelay(int index) {
    return initialDelay + letterStagger * index;
  }

  static final iconDelay = letterDelay(3) + letterDuration + iconGap;
  static final expansionDelay = iconDelay + iconDuration + holdDuration;
  static final totalDuration =
      expansionDelay + expansionDuration + navigationGap;
}
