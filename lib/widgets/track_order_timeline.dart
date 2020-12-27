import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

// ignore: must_be_immutable
class TrackOrderTimeLine extends StatefulWidget {
  TrackOrderTimeLine({
    Key key,
    this.onTap,
    this.serviceName,
    this.priceToPay,
    this.orderDeliveryAddress,
    this.dateTime,
    this.orderStatus,
    this.orderProcessColor,
    this.orderProcessLinColor,
    this.orderAssingnedColor,
    this.orderAssignedLineColor,
    this.orderStatusColor,
  }) : super(key: key);
  final Function onTap;
  final String serviceName;
  final double priceToPay;
  final String orderDeliveryAddress;
  final String dateTime;
  final String orderStatus;
  final Color orderProcessColor;
  final Color orderProcessLinColor;
  final Color orderAssingnedColor;
  final Color orderAssignedLineColor;
  Color orderStatusColor;

  @override
  _TrackOrderTimeLineState createState() => _TrackOrderTimeLineState();
}

class _TrackOrderTimeLineState extends State<TrackOrderTimeLine> {
  checkStausColor() {
    if (widget.orderStatus == 'Accepted') {
      setState(() {
        widget.orderStatusColor = CargicColors.willGreen;
      });
    } else if (widget.orderStatus == 'Pending') {
      widget.orderStatusColor = CargicColors.fearYellow;
    } else {
      widget.orderStatusColor = CargicColors.rageRed;
    }
  }

  @override
  Widget build(BuildContext context) {
    checkStausColor();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CargicColors.plainWhite,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: CargicColors.cosmicShadow,
                  blurRadius: 5,
                  offset: Offset(0, 2.5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (widget.serviceName != null)
                                ? '${widget.serviceName}'
                                : '',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            (widget.priceToPay != null)
                                ? '- $nigerianCurrency ${widget.priceToPay}'
                                : '',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: CargicColors.rageRed,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      Text(
                        (widget.orderDeliveryAddress != null)
                            ? '${widget.orderDeliveryAddress}'
                            : '',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        (widget.dateTime != null) ? '${widget.dateTime}' : '',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TimelineTile(
                          alignment: TimelineAlign.manual,
                          lineXY: 0.1,
                          isFirst: true,
                          indicatorStyle: const IndicatorStyle(
                            width: 15,
                            color: CargicColors.willGreen,
                            padding: EdgeInsets.all(4),
                          ),
                          endChild: const TrackOrderTimeLineInfo(
                            title: 'Order Placed',
                            message: 'We have received your order.',
                          ),
                          beforeLineStyle: const LineStyle(
                            color: CargicColors.willGreen,
                          ),
                        ),
                        TimelineTile(
                          alignment: TimelineAlign.manual,
                          lineXY: 0.1,
                          indicatorStyle: const IndicatorStyle(
                            width: 15,
                            color: CargicColors.willGreen,
                            padding: EdgeInsets.all(4),
                          ),
                          endChild: const TrackOrderTimeLineInfo(
                            title: 'Order Confirmed',
                            message: 'Your order has been confirmed.',
                          ),
                          beforeLineStyle: const LineStyle(
                            color: CargicColors.willGreen,
                          ),
                        ),
                        TimelineTile(
                          alignment: TimelineAlign.manual,
                          lineXY: 0.1,
                          indicatorStyle: IndicatorStyle(
                            width: 15,
                            color: (widget.orderProcessColor != null)
                                ? widget.orderProcessColor
                                : CargicColors.brandBlue,
                            padding: EdgeInsets.all(4),
                          ),
                          endChild: const TrackOrderTimeLineInfo(
                            title: 'Order Processed',
                            message: 'We are preparing your order.',
                          ),
                          beforeLineStyle: LineStyle(
                            color: CargicColors.willGreen,
                          ),
                          afterLineStyle: LineStyle(
                            color: (widget.orderProcessLinColor != null)
                                ? widget.orderProcessLinColor
                                : CargicColors.smoothGray,
                          ),
                        ),
                        TimelineTile(
                          alignment: TimelineAlign.manual,
                          lineXY: 0.1,
                          isLast: true,
                          indicatorStyle: IndicatorStyle(
                            width: 15,
                            color: (widget.orderAssingnedColor != null)
                                ? widget.orderAssingnedColor
                                : CargicColors.smoothGray,
                            padding: EdgeInsets.all(4),
                          ),
                          endChild: const TrackOrderTimeLineInfo(
                            disabled: true,
                            title: 'Ninja assigned',
                            message:
                                'Sit back and relax, our Ninja will come to you',
                          ),
                          beforeLineStyle: LineStyle(
                            color: (widget.orderAssignedLineColor != null)
                                ? widget.orderAssignedLineColor
                                : CargicColors.smoothGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Status: ',
                          style: TextStyle(
                              color: CargicColors.brandBlue, fontSize: 12),
                        ),
                        Text(
                          (widget.orderStatus != null)
                              ? '${widget.orderStatus}'
                              : '',
                          style: TextStyle(
                              color: (widget.orderStatusColor != null)
                                  ? widget.orderStatusColor
                                  : CargicColors.fearYellow,
                              fontSize: 12),
                        )
                      ],
                    ),
                    TrackOrderNextButton(
                      onTap: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TrackOrderNextButton extends StatelessWidget {
  const TrackOrderNextButton({
    Key key,
    this.onTap,
  }) : super(key: key);
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: CargicColors.boringWhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: CargicColors.cosmicShadow,
              blurRadius: 5,
              offset: Offset(0, 2.5),
            )
          ],
        ),
        child: Text(
          'Next',
          style: TextStyle(
            color: CargicColors.grimBlack,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class TrackOrderTimeLineInfo extends StatelessWidget {
  const TrackOrderTimeLineInfo({
    Key key,
    this.asset,
    this.title,
    this.message,
    this.disabled = false,
  }) : super(key: key);

  final String asset;
  final String title;
  final String message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
