class TastyTimePickerModel {
  final String time;
  bool isSelected;

  TastyTimePickerModel({
    this.time,
    this.isSelected,
  });
}

class AmPm {
  final String timeOfDay;
  bool isSelected;
  AmPm({this.timeOfDay});
}
