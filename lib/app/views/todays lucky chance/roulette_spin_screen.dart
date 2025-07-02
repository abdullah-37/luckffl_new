import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class RouletteSpinScreen extends StatefulWidget {
  const RouletteSpinScreen({super.key});

  @override
  _SpinningWheelState createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<RouletteSpinScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _currentRotation = 0.0;
  String _result = '';
  bool _isSpinning = false;

  // Define the sections (8 sections)
  final List<String> _sections = [
    '',
    '',
    '',
    'Section 4',
    'Section 5',
    'Section 6',
    'Section 7',
    'Section 8',
  ];

  final List<Color> _sectionColors = [
    const Color(0xFFFFF4E6), // Light cream
    const Color(0xFFFFF176), // Light yellow
    const Color(0xFFFFF4E6), // Light cream
    const Color(0xFFFFF176), // Light yellow
    const Color(0xFFFFF4E6), // Light cream
    const Color(0xFFFFF176), // Light yellow
    const Color(0xFFFFF4E6), // Light cream
    const Color(0xFFFFF176), // Light yellow
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Initialize the animation with a default value
    _animation = Tween<double>(begin: 0.0, end: 0.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _spinWheel() {
    if (_isSpinning) return;

    setState(() {
      _isSpinning = true;
      _result = '';
    });

    // Generate random rotation (multiple full rotations + random end position)
    final random = math.Random();
    final extraRotations = 5 + random.nextInt(5); // 5-9 full rotations
    final finalPosition = random.nextDouble() * 2 * math.pi;
    final totalRotation = extraRotations * 2 * math.pi + finalPosition;

    _animation = Tween<double>(
      begin: _currentRotation,
      end: _currentRotation + totalRotation,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward(from: 0).then((_) {
      _currentRotation = _animation.value % (2 * math.pi);
      _determineResult();
      setState(() {
        _isSpinning = false;
        showDialog(
          context: context,
          builder: (context) => const CustomDialuge(),
        );
      });
    });
  }

  void _determineResult() {
    // Calculate which section the pointer is pointing to
    // The pointer is at the top (12 o'clock position)
    double normalizedRotation =
        (2 * math.pi - _currentRotation) % (2 * math.pi);
    double sectionAngle = 2 * math.pi / 8;
    int sectionIndex = (normalizedRotation / sectionAngle).floor();

    setState(() {
      _result = _sections[sectionIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: const AppbarWithPoints(backgroundColor: Color(0xFFffffff)),

      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Base/Stand
                // Container(
                //   width: 320,
                //   height: 40,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     gradient: const LinearGradient(
                //       colors: [
                //         Color(0xFF9C27B0),
                //         Color(0xFFE91E63),
                //         Color(0xFFFFC107),
                //       ],
                //       begin: Alignment.centerLeft,
                //       end: Alignment.centerRight,
                //     ),
                //   ),
                // ),
                // Main wheel container
                SizedBox(
                  width: 300.w,
                  height: 300.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer ring with dots
                      Container(
                        // padding: const EdgeInsets.all(4),
                        width: 300.w,
                        height: 300.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFC107),
                              Color(0xFFE91E63),
                              Color(0xFF9C27B0),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(.0),
                          child: CustomPaint(painter: DotsPainter()),
                        ),
                      ),
                      // Inner wheel
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _isSpinning
                                ? _animation.value
                                : _currentRotation,
                            child: SizedBox(
                              width: 260.w,
                              height: 260.h,
                              child: CustomPaint(
                                painter: WheelPainter(
                                  _sectionColors,
                                  _sections,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // Center circle
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Pointer/Arrow
                // Positioned(
                //   top: -10,
                //   child: Container(
                //     width: 0,
                //     height: 0,
                //     decoration: const BoxDecoration(
                //       border: Border(
                //         left: BorderSide(width: 15, color: Colors.transparent),
                //         right: BorderSide(width: 15, color: Colors.transparent),
                //         bottom: BorderSide(width: 25, color: Color(0xFFFFC107)),
                //       ),
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 0,
                  // right: 20,
                  child: CustomPaint(
                    size: const Size(50, 50), // Adjust size as needed
                    painter: TrianglePointerPainter(),
                  ),
                ),
              ],
            ),
            const Spacer(),

            // text
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '유의사항',
                style: AppTextStyles.bodySubtitle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const Text(
              '• 룰렛은 1회 이용 시 100포인트가 차감됩니다. 포인트는 사용 즉시 소진되며 환불이 불가능합니다.\n• 보상은 즉시 ‘나의 티켓’ 또는 ‘포인트 내역’에 반영됩니다. 반영되지 않을 경우, 앱을 재실행하거나 고객센터로 문의해주세요.\n• 비정상적인 포인트 사용이나 자동화 시도가 감지될 경우 이용이 제한될 수 있으며, 보상 회수 또는 계정 이용 제한이 적용될 수 있습니다.\n• 본 룰렛 이벤트는 내부 사정에 따라 사전 공지 없이 변경 또는 종료될 수 있습니다.',
            ),
            SizedBox(height: 30.h),

            CustomElevatedButton(
              onTap: () {
                _spinWheel();
                // Get.to(() => const SpinningWheel());
                // showDialog(
                //   context: context,
                //   builder: (context) => const CustomDialuge(),
                // );
              },
              title: '룰렛 돌리기',
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

class WheelPainter extends CustomPainter {
  final List<Color> sectionColors;
  final List<String> sections;

  WheelPainter(this.sectionColors, this.sections);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final sectionAngle = 2 * math.pi / sections.length;

    // Draw sections
    for (int i = 0; i < sections.length; i++) {
      final paint = Paint()
        ..color = sectionColors[i]
        ..style = PaintingStyle.fill;

      final startAngle = i * sectionAngle - math.pi / 2;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sectionAngle,
        true,
        paint,
      );

      // Draw section borders
      final borderPaint = Paint()
        ..color = Colors.white.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sectionAngle,
        true,
        borderPaint,
      );

      // Draw text
      final textAngle = startAngle + sectionAngle / 2;
      final textRadius = radius * 0.7;
      final textX = center.dx + textRadius * math.cos(textAngle);
      final textY = center.dy + textRadius * math.sin(textAngle);

      final textPainter = TextPainter(
        text: const TextSpan(
          text: '',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      canvas.save();
      canvas.translate(textX, textY);
      canvas.rotate(textAngle + math.pi / 2);
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );
      canvas.restore();
    }

    // Draw outer border
    final outerBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawCircle(center, radius, outerBorderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TrianglePointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFC107), Color(0xFFFFD54F), Color(0xFFFFC107)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    final path = Path();
    final shadowPath = Path();

    // Create triangle shape (pointing down)
    final centerX = size.width / 2;
    const topY = 2.0;
    final bottomY = size.height - 2;
    const leftX = 4.0;
    final rightX = size.width - 4;

    // Shadow path (slightly offset)
    shadowPath.moveTo(centerX + 1, bottomY + 2);
    shadowPath.lineTo(leftX + 1, topY + 2);
    shadowPath.lineTo(rightX + 1, topY + 2);
    shadowPath.close();

    // Main triangle path
    path.moveTo(centerX, bottomY);
    path.lineTo(leftX, topY);
    path.lineTo(rightX, topY);
    path.close();

    // Draw shadow first
    canvas.drawPath(shadowPath, shadowPaint);

    // Draw main triangle
    canvas.drawPath(path, paint);

    // Add highlight effect
    final highlightPaint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final highlightPath = Path();
    highlightPath.moveTo(leftX + 1, topY + 1);
    highlightPath.lineTo(centerX, bottomY - 2);
    highlightPath.lineTo(rightX - 1, topY + 1);

    canvas.drawPath(highlightPath, highlightPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw dots around the circle
    for (int i = 0; i < 24; i++) {
      final angle = (i * 2 * math.pi) / 24;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      canvas.drawCircle(Offset(x, y), 3, dotPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CustomDialuge extends StatelessWidget {
  const CustomDialuge({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 320.w,
        padding: EdgeInsets.all(30.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            //image
            Image.asset(AppImages.partyingface, height: 80.h),
            Text('축하해요!', style: AppTextStyles.bodytitlesmall),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.ticketbrown, height: 30.h),
                Text('+ 브론즈 티켓 3장', style: AppTextStyles.bodytitlesmall),
              ],
            ),
            // Action buttons
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {},
                    title: '그만하기',
                    color: const Color(0xFFfafafa),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(onTap: () {}, title: '한번 더'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
