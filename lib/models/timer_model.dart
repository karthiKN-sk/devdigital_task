class TimerModel {
  String? iD;
  String? seconds;
  Duration? duration;
  bool? startStop;

  TimerModel({this.iD, this.duration, this.seconds, this.startStop});

  TimerModel copyWith({
    String? iD,
    Duration? duration,
    String? seconds,
    bool? startStop,
  }) {
    return TimerModel(
      iD: iD ?? this.iD,
      seconds: seconds ?? this.seconds,
      duration: duration ?? this.duration,
      startStop: startStop ?? this.startStop,
    );
  }
}
