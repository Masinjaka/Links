import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import 'package:linkvault/features/splash/presentation/splash_page.dart';

@Preview(name: 'Rohy splash', group: 'Splash', size: Size(432, 930))
Widget rohySplashPreview() {
  return SplashPage(onComplete: _ignoreCompletion);
}

void _ignoreCompletion() {}
