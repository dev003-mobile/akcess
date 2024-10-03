import 'dart:async';

import 'package:flutter/material.dart';

class VerificationOTPStore {
  late FocusNode firstCodeFocusNode = FocusNode();
  late FocusNode secondCodeFocusNode = FocusNode();
  late FocusNode thirdCodeFocusNode = FocusNode();
  late FocusNode fourthCodeFocusNode = FocusNode();

  late TextEditingController firstCodeEditingController = TextEditingController();
  late TextEditingController secondCodeEditingController = TextEditingController();
  late TextEditingController thirdCodeEditingController = TextEditingController();
  late TextEditingController fourthCodeEditingController = TextEditingController();

  Timer? timer;

  late ValueNotifier<String> otp;
  late ValueNotifier<int> seconds;

  String formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        timer.cancel();
      }
    });
  }
}
