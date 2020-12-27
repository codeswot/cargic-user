import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/cargic_req_service_button.dart';
import 'package:cargic_user/widgets/profile_image.dart';
import 'package:cargic_user/widgets/smooth_star_rating.dart';
import 'package:flutter/material.dart';

class RequestedServiceProviderCard extends StatelessWidget {
  const RequestedServiceProviderCard({
    Key key,
    this.profilePic,
    this.serviceProviderName,
    this.serviceProviderDistance,
    this.serviceProviderRating,
    this.onCallTap,
    this.serviceProviderAddedInfo,
    this.onSecondaryTap,
    this.secondaryButtonIcon,
    this.secondaryButtonTitle,
  }) : super(key: key);
  final String profilePic;
  final String serviceProviderName;
  final String serviceProviderAddedInfo;
  final double serviceProviderDistance;
  final double serviceProviderRating;
  final Function onCallTap;
  final Function onSecondaryTap;
  final IconData secondaryButtonIcon;
  final String secondaryButtonTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170, //TODO media Q

      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),

      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 9,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: (profilePic != null)
                      ? ProfilePic(profilePic: profilePic)
                      : Container(),
                ),
                SizedBox(width: 11),
                Container(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (serviceProviderName != null)
                            ? serviceProviderName
                            : '',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        (serviceProviderDistance != null)
                            ? '$serviceProviderDistance km away' //m or km
                            : '',
                        style: TextStyle(
                          color: CargicColors.smoothGray,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        (serviceProviderAddedInfo != null)
                            ? serviceProviderAddedInfo
                            : '',
                        style: TextStyle(fontSize: 13),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 10),
                      SmoothStarRating(
                        color: CargicColors.fearYellow,
                        borderColor: CargicColors.fearYellow,
                        starCount: 5,
                        isReadOnly: true,
                        rating: (serviceProviderRating != null)
                            ? serviceProviderRating
                            : 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CargicReqServiceButtons(
                  icon: Icons.phone,
                  buttonTitle: 'Call',
                  onTap: onCallTap,
                ),
                SizedBox(width: 10),
                CargicReqServiceButtons(
                  icon: (secondaryButtonIcon != null)
                      ? secondaryButtonIcon
                      : Icons.directions,
                  buttonTitle: (secondaryButtonTitle != null)
                      ? secondaryButtonTitle
                      : 'Direction',
                  onTap: onSecondaryTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
