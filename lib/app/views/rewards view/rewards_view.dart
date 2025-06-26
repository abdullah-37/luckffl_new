import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luck_ffle/app/views/home%20screen/widgets/challenge_widget.dart';
import 'package:luck_ffle/app/widgets/points_widget.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class RewardsView extends StatelessWidget {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '혜택',
          style: AppTextStyles.bodytitleLarge.copyWith(fontSize: 30),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: PointsWidget(),
          ),
          SizedBox(width: 10.w),
        ],
      ),

      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('오늘의 럭키 찬스', style: AppTextStyles.bodytitleLarge),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: 7,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FirstComeChallengeWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
