import 'package:cargic_user/utils/cargic_icons_icons.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class NinjaScreen extends StatelessWidget {
  static const String id = 'NinjaScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15), //
              NinjaCard(),
              NinjaCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class NinjaCard extends StatelessWidget {
  const NinjaCard({
    Key key,
  }) : super(key: key);

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
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: CargicColors.brandBlue,
                width: 1.5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://media.istockphoto.com/photos/mechanic-holding-tools-picture-id502423025?k=6&m=502423025&s=612x612&w=0&h=A0KcriQYfA8h15t6q8rkSoAclBtaHG0GFhBnVpDcnqA=',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 11.5),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Musa Damu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Profesional Car Wash',
                  style: TextStyle(
                    color: CargicColors.smoothGray,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Professional Car Service',
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
                    rating: 4,
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
