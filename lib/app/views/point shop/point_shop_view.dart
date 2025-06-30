import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/views/point%20shop/app_38.dart';
import 'package:luck_ffle/app/views/point%20shop/product_details.dart';
import 'package:luck_ffle/app/widgets/points_widget.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '포인트샵',
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    const CategoryGridWidget(),
                    SizedBox(height: 40.h),
                    const PopularItemsWidget(),
                    SizedBox(height: 40.h),
                    const PointsHelpWidget(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryGridWidget extends StatelessWidget {
  const CategoryGridWidget({super.key});

  final List<CategoryItem> categories = const [
    CategoryItem(title: '커피/음료', step: 1),
    CategoryItem(title: '베이커리/도넛', step: 2),
    CategoryItem(title: '치킨', step: 3),
    CategoryItem(title: '아이스크림', step: 4),
    CategoryItem(title: '치킨', step: 5),
    CategoryItem(title: '햄버거/피자', step: 6),
    CategoryItem(title: '도시/영화/기타', step: 7),
    CategoryItem(title: '편의점', step: 8),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: 0.7,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItemWidget(category: categories[index], index: index);
      },
    );
  }
}

class CategoryItem {
  final String title;
  final int step;

  const CategoryItem({required this.title, required this.step});
}

class CategoryItemWidget extends StatelessWidget {
  final CategoryItem category;
  final int index;

  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const App38());
      },
      child: Column(
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
            category.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class PopularItemsWidget extends StatelessWidget {
  const PopularItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('포인트샵 인기템 TOP!', style: AppTextStyles.bodytitleLarge),
        SizedBox(height: 20.h),
        SizedBox(
          height: 220.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              PopularItemCard(
                imageUrl: "https://picsum.photos/400/300?random=1",
                category: '커피/음료',
                title: '스타벅스 아이스아메리카노 Tall',
                points: '16,000',
                step: 3,
              ),
              PopularItemCard(
                imageUrl: "https://picsum.photos/400/300?random=2",
                category: '베이커리/도넛',
                title: '던킨 콜드(아메리카노+글레이즈드)',
                points: '16,000',
                step: 0,
              ),
              PopularItemCard(
                imageUrl: "https://picsum.photos/400/300?random=3",
                category: '도시/영화/기타',
                title: 'IVE 발렌타인 아이스 티켓 할인',
                points: '16,000',
                step: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PopularItemCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String points;
  final int step;

  const PopularItemCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.points,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => const ProductDetails());
        },
        child: SizedBox(
          width: 130.w,
          // margin: EdgeInsets.only(right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  // height: 120.h,
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
                  SvgPicture.asset(AppIcons.pIcon),
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
      ),
    );
  }
}

class PointsHelpWidget extends StatelessWidget {
  const PointsHelpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('포인트가 부족할 때?', style: AppTextStyles.bodytitlesmall),
        SizedBox(height: 20.h),
        const PointsHelpItem(
          icon: 'https://via.placeholder.com/50x50/4285F4/FFFFFF?text=👆',
          title: '미션 완료하고\n포인트 적립하기!',
          buttonText: '이동',
          step: 4,
        ),
        SizedBox(height: 15.h),
        const PointsHelpItem(
          icon: 'https://via.placeholder.com/50x50/34A853/FFFFFF?text=⚡',
          title: '포인트 부족?\n충전소에서 해결하세요!',
          buttonText: '이동',
          step: 5,
        ),
      ],
    );
  }
}

class PointsHelpItem extends StatelessWidget {
  final String icon;
  final String title;
  final String buttonText;
  final int step;

  const PointsHelpItem({
    super.key,
    required this.icon,
    required this.title,
    required this.buttonText,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: Image.asset(AppImages.challenge),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                height: 1.3,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFfff6c9),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
