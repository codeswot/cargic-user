import 'package:cargic_user/models/front_end_models/date_picker_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/tasty_time_picker.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class CarServicesBookLater extends StatefulWidget {
  const CarServicesBookLater({
    Key key,
  }) : super(key: key);

  @override
  _CarServicesBookLaterState createState() => _CarServicesBookLaterState();
}

class _CarServicesBookLaterState extends State<CarServicesBookLater> {
  List<TastyTimePickerModel> sampleData = new List<TastyTimePickerModel>();
  List<AmPm> amPmData = new List<AmPm>();
  @override
  void initState() {
    super.initState();
    setState(() {
      amPmData.add(
        AmPm(timeOfDay: 'AM', isSelected: false),
      );
      amPmData.add(
        AmPm(timeOfDay: 'PM', isSelected: false),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '12:00',
        ),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '01:00',
        ),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '02:00',
        ),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '03:00',
        ),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '04:00',
        ),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '05:00',
        ),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '06:00',
        ),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '07:00',
        ),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '08:00',
        ),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '09:00',
        ),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '10:00',
        ),
      );
      sampleData.add(
        TastyTimePickerModel(
          isSelected: false,
          time: '11:00',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Select Date',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 9),
        Container(
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            height: 90,
            selectedTextColor: CargicColors.brandBlue,
            onDateChange: (date) {
              print(date);
            },
          ),
        ),
        SizedBox(height: 15),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Select Time',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 9),
        Container(
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    amPmData.forEach((element) => element.isSelected = false);
                    amPmData[index].isSelected = true;
                  });
                },
                child: AmPmCard(
                  timeOfDay: amPmData[index].timeOfDay,
                  isPicked: amPmData[index].isSelected,
                ),
              );
            },
            itemCount: amPmData.length,
          ),
        ),
        Container(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    sampleData.forEach((element) => element.isSelected = false);
                    sampleData[index].isSelected = true;
                  });
                },
                child: TastyMonthPicker(
                  time: sampleData[index].time,
                  isPicked: sampleData[index].isSelected,
                ),
              );
            },
            itemCount: sampleData.length,
          ),
        ),
      ],
    );
  }
}
