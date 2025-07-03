import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/app_38_controller.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class App38 extends GetView<App38Controller> {
  const App38({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('커피/음료'),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- Horizontal Category List ---
            SizedBox(height: 12.h),
            SizedBox(
              height: 90.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // adjust count as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: CategoryItemWidgetS(title: "투썸플레이스 ", index: index),
                  );
                },
              ),
            ),

            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('상품 1,234', style: AppTextStyles.bodytitlesmall),
                Row(
                  children: [
                    Text('인기순', style: AppTextStyles.bodySubtitle),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ],
            ),

            /// --- Popular Items Grid ---
            SizedBox(height: 12.h),
            Expanded(
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  return PopularItemCardS(
                    imageUrl: "https://picsum.photos/400/300?random=$index",
                    category: "메가커피",
                    title: "(ICE)흑당버블밀크티라떼",
                    points: "16,000",
                    step: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItemWidgetS extends StatelessWidget {
  final String title;
  final int index;

  const CategoryItemWidgetS({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.network(
              "https://picsum.photos/400/300?random=$index",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.image,
                    color: Colors.grey[400],
                    size: 30.sp,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.sp, color: Colors.black87),
        ),
      ],
    );
  }
}

class PopularItemCardS extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String points;
  final int step;

  const PopularItemCardS({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.points,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppPages.productDetails);
      },
      child: Container(
        width: 130.w,
        margin: EdgeInsets.only(right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.image,
                        color: Colors.grey[400],
                        size: 40.sp,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFfff6c9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              title,
              style: AppTextStyles.bodyText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.primaryColor,
                  child: Text(
                    'P',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  points,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
