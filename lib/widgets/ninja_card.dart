import 'package:cargic_user/utils/cargic_icons_icons.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/cargic_profile_picture.dart';
import 'package:cargic_user/widgets/smooth_star_rating.dart';
import 'package:flutter/material.dart';

class NinjaCard extends StatelessWidget {
  const NinjaCard({
    Key key,
    this.ninjaName,
    this.ninjaState,
    this.ninjaProfession,
    this.ninjaRating,
    this.ninjaImage,
  }) : super(key: key);
  final String ninjaName;
  final String ninjaState;
  final String ninjaProfession;
  final String ninjaImage;

  final double ninjaRating;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 23),
      margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 9,
            offset: Offset(0.0, 6.0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CargicProfilePic(
              width: 80.0,
              height: 80.0,
              image: (ninjaImage != null)
                  ? ninjaImage
                  : ''), //TODO:put a cargic icon,
          SizedBox(width: 11.5),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (ninjaName != null) ? ninjaName : '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  (ninjaState != null) ? ninjaState : '',
                  style: TextStyle(
                    color: CargicColors.smoothGray,
                    fontSize: 14,
                  ),
                ),
                Text(
                  (ninjaProfession != null) ? ninjaProfession : '',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  child: SmoothStarRating(
                    allowHalfRating: false,
                    onRated: (v) {},
                    starCount: 5,
                    rating: (ninjaRating != null) ? ninjaRating : 0,
                    size: 25.0,
                    isReadOnly: true,
                    defaultIconData: CargicIcons.inactive_star,
                    filledIconData: CargicIcons.active_star,
                    color: CargicColors.fearYellow,
                    borderColor: CargicColors.faintingGrey,
                    spacing: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
