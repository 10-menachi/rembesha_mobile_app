import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rembesha_mobile_app/widgets/indicator.dart';
import 'package:rembesha_mobile_app/utils/constants.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<String> images = [
    "assets/images/splash.jpeg",
    "assets/images/splash_two.jpg",
    "assets/images/splash_three.jpg",
  ];
  List<String> icons = [
    "assets/icons/right-arrow.svg",
    "assets/icons/loop.svg",
    "assets/icons/card.svg",
  ];
  List<String> texts = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed ipsum orci. Aliquam vitae mauris et dui rutrum porta non efficitur justo. Fusce ipsum augue. ",
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam sit debitis quae, distinctio repellat est nam velit sunt eum? Fuga?",
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam sapiente reiciendis ab accusantium aspernatur rem, dolores ipsa voluptatum ullam perferendis.",
  ];

  void _previous() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    } else {
      setState(() {
        currentIndex = images.length - 1;
      });
    }
  }

  void _next() {
    if (currentIndex < images.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      setState(() {
        currentIndex = 0;
      });
    }
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapUp: (TapUpDetails details) {
          final RenderBox box = context.findRenderObject() as RenderBox;
          final double widgetWidth = box.size.width;
          final double tapX = details.localPosition.dx;

          if (tapX < widgetWidth / 2) {
            _previous();
          } else {
            _next();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(images[currentIndex]),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SvgPicture.asset(
                    icons[currentIndex],
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    height: 125.0,
                    width: 125.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      texts[currentIndex],
                      textAlign: TextAlign.center,
                      style: pTextStyle,
                    ),
                  ),
                  Indicator(
                    currentIndex: currentIndex,
                    count: images.length,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: IconButton(
                      iconSize: 65,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      icon: Icon(
                        Icons.arrow_circle_right_rounded,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
