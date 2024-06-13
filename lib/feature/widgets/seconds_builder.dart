import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_board/core/utils.dart';

class SecondsBuilder extends StatefulWidget {
  const SecondsBuilder({
    super.key,
    this.shouldPlay,
    required this.initTimeInSeconds,
    this.textStyle,
    this.textAlign = TextAlign.end,
  });

  final TextStyle? textStyle;
  final TextAlign textAlign;
  final DateTime initTimeInSeconds;
  final bool? shouldPlay;

  @override
  State<SecondsBuilder> createState() => _SecondsBuilderState();
}

class _SecondsBuilderState extends State<SecondsBuilder> {
  final Stream<int> _secondsStream = Stream<int>.periodic(
    const Duration(seconds: 1),
    (int count) => count,
  );

  late StreamSubscription _subcription;

  late int _seconds;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    int initialDifference = now.difference(widget.initTimeInSeconds).inSeconds;
    _seconds = initialDifference;
    _subcription = _secondsStream.listen((event) {
      setState(() => _seconds = initialDifference + event);
    });
    if (widget.shouldPlay != null && widget.shouldPlay == true) {
      _subcription.resume();
    } else {
      _subcription.pause();
    }
  }

  @override
  void dispose() {
    _subcription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Text(
        Utils.toTimerFormat(_seconds),
        textAlign: widget.textAlign,
        style: widget.textStyle ??
            Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 26,
                ),
      ),
    );
  }
}
