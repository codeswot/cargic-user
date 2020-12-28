import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/smooth_star_rating.dart';
import 'package:flutter/material.dart';

class FeedbackContainer extends StatelessWidget {
  const FeedbackContainer({
    Key key,
    this.rating,
    this.feedBackController,
    this.onRated,
    this.onChanged,
  }) : super(key: key);
  final double rating;
  final TextEditingController feedBackController;
  final Function onRated;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 9,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('How was the job ?'),
          SizedBox(height: 16),
          SmoothStarRating(
            size: 31.0,
            starCount: 5,
            borderColor: CargicColors.fearYellow,
            color: CargicColors.fearYellow,
            rating: (rating != null) ? rating : 0,
            onRated: onRated,
          ),
          SizedBox(height: 20),
          Container(
            child: TextField(
              controller: feedBackController,
              decoration: InputDecoration(
                hintText: 'Provide your feedback.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
