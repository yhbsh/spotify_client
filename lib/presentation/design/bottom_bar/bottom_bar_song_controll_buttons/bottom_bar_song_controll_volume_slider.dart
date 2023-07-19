import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/presentation/notifiers/current_song_notifier.dart';

class BottomBarSongControllVolumeSlider extends StatefulWidget {
  const BottomBarSongControllVolumeSlider({super.key});

  @override
  State<BottomBarSongControllVolumeSlider> createState() =>
      _BottomBarSongControllVolumeSliderState();
}

class _BottomBarSongControllVolumeSliderState extends State<BottomBarSongControllVolumeSlider> {
  late double _value = 1;
  late final CurrentSongNotifier _notifier;

  @override
  void initState() {
    _notifier = context.read<CurrentSongNotifier>();
    super.initState();
  }

  void _onSliderChanged(double value) {
    setState(() => _value = value);

    _notifier.setVolume(value);
  }

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
