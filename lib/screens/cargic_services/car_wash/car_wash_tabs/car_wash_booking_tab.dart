import 'package:cargic_user/models/date_picker_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/app_bar_button.dart';
import 'package:cargic_user/widgets/tasty_time_picker.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class CarWashBookingTab extends StatefulWidget {
  const CarWashBookingTab();
  @override
  _CarWashBookingTabState createState() => _CarWashBookingTabState();
}

class _CarWashBookingTabState extends State<CarWashBookingTab> {
  bool isBookNow = false;
  bool isBookLater = false;
  bool isNotBookSelect = true;
  checkBookNow() {
    setState(() {
      isBookNow = true;
      isNotBookSelect = false;

      isBookLater = false;
    });
  }

  checkBookLater() {
    setState(() {
      isBookNow = false;
      isNotBookSelect = false;
      isBookLater = true;
    });
  }

  List<TastyTimePickerModel> sampleData = new List<TastyTimePickerModel>();
  List<AmPm> amPmData = new List<AmPm>();

  @override
  void initState() {
    super.initState();
    setState(() {
      isNotBookSelect = true;
      amPmData.add(
        AmPm(timeOfDay: 'AM'),
      );
      amPmData.add(
        AmPm(timeOfDay: 'PM'),
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
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBarButton(
                buttonColor: (isBookNow)
                    ? CargicColors.brandBlue
                    : CargicColors.plainWhite,
                titleColor: (isBookNow)
                    ? CargicColors.plainWhite
                    : CargicColors.pitchBlack,
                buttonTitle: 'Book Now',
                onTap: () {
                  //get book now
                  checkBookNow();
                  //next tab
                },
              ),
              SizedBox(width: 10),
              AppBarButton(
                buttonColor: (isBookLater)
                    ? CargicColors.brandBlue
                    : CargicColors.plainWhite,
                titleColor: (isBookLater)
                    ? CargicColors.plainWhite
                    : CargicColors.pitchBlack,
                buttonTitle: 'Book Later',
                onTap: () {
                  checkBookLater();
                  //get book later
                },
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(80),
      ),
      body: Container(
        child: (isNotBookSelect)
            ? Container()
            : (isBookNow)
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Text('Select Date'),
                        ),
                        SizedBox(height: 9),
                        Container(
                          child: DatePicker(
                            DateTime.now(),
                            initialSelectedDate: DateTime.now(),
                            height: 90,
                            onDateChange: (date) {
                              print(date);
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Text('Select Time'),
                        ),
                        SizedBox(height: 9),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          height: 65,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    amPmData.forEach((element) =>
                                        element.isSelected = false);
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
                        SizedBox(height: 15),
                        Container(
                          height: 90,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sampleData.forEach((element) =>
                                        element.isSelected = false);
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
                    ),
                  ),
      ),
    );
  }
}
