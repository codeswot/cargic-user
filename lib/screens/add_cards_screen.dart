import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/sweet_text_field.dart';
import 'package:flutter/material.dart';

class AddCards extends StatefulWidget {
  static const String id = 'AddCards';
  @override
  _AddCardsState createState() => _AddCardsState();
}

class _AddCardsState extends State<AddCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a payment method'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(), //card

              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 30,
                ),
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 15,
                  bottom: 49,
                ),
                decoration: BoxDecoration(
                  color: CargicColors.plainWhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: CargicColors.cosmicShadow,
                      blurRadius: 8.0,
                      offset: Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Credit card number ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: CargicColors.rageRed,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 9),
                    SweetTextField(
                      keyBoardType: TextInputType.number,
                      hintText: '1234 5678 9012 3456',
                      maxLength: 16,
                    ),
                    SizedBox(height: 12.5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name on card ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: CargicColors.rageRed,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 9),
                    SweetTextField(
                      hintText: 'Mubarak Ibrahim',
                    ),
                    SizedBox(height: 12.5),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Expiration date ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                      color: CargicColors.rageRed,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 9),
                              SweetTextField(
                                keyBoardType: TextInputType.datetime,
                                maxLength: 5,
                                hintText: '12/08 ',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.5),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CSV ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                      color: CargicColors.rageRed,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 9),
                              SweetTextField(
                                hintText: '123',
                                maxLength: 3,
                                keyBoardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 140,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CargicColors.brandBlue,
                ),
                child: Center(
                    child: Text(
                  'Save Card',
                  style: TextStyle(
                    color: CargicColors.plainWhite,
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
