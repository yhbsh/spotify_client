import 'package:flutter/material.dart';

class BottomBarSongControllVolumeSlider extends StatefulWidget {
  const BottomBarSongControllVolumeSlider({super.key});

  @override
  State<BottomBarSongControllVolumeSlider> createState() => _BottomBarSongControllVolumeSliderState();
}

class _BottomBarSongControllVolumeSliderState extends State<BottomBarSongControllVolumeSlider> {
  late double _value = 1;

  void _onSliderChanged(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      onChanged: _onSliderChanged,
      min: 0,
      max: 1,
    );
  }
}
