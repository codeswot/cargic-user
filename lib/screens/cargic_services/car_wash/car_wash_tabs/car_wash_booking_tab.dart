import 'package:cargic_user/models/date_picker_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/app_bar_button.dart';
import 'package:cargic_user/widgets/tasty_month_picker.dart';
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

  List<TastyMonthPickerModel> sampleData = new List<TastyMonthPickerModel>();
  @override
  void initState() {
    super.initState();
    setState(() {
      isNotBookSelect = true;
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'January',
          monthNumber: 01,
        ),
      );
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'Febuary',
          monthNumber: 02,
        ),
      );
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'March',
          monthNumber: 03,
        ),
      );
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'April',
          monthNumber: 04,
        ),
      );
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'May',
          monthNumber: 05,
        ),
      );
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'June',
          monthNumber: 06,
        ),
      );
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'July',
          monthNumber: 07,
        ),
      );
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'August',
          monthNumber: 08,
        ),
      );
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'September',
          monthNumber: 09,
        ),
      );
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'October',
          monthNumber: 10,
        ),
      );
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'November',
          monthNumber: 11,
        ),
      );
      sampleData.add(
        TastyMonthPickerModel(
          isSelected: false,
          monthName: 'December',
          monthNumber: 12,
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
                      children: [
                        Text('Select Date'),
                        Container(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  //get/price,name,discount
                                  setState(() {
                                    sampleData.forEach((element) =>
                                        element.isSelected = false);
                                    sampleData[index].isSelected = true;
                                  });
                                },
                                child: TastyMonthPicker(
                                  monthName: sampleData[index].monthName,
                                  isPicked: sampleData[index].isSelected,
                                ),
                              );
                            },
                            itemCount: sampleData.length,
                          ),
                        ),
                        // Container(
                        //   child: DatePicker(
                        //     DateTime.now(),
                        //     initialSelectedDate: DateTime.now(),
                        //     height: 90,
                        //   ),
                        // ),
                        Text('false'),
                      ],
                    ),
                  ),
      ),
    );
  }
}
