import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:matjarcom/globals.dart';
import 'package:matjarcom/screens/main_acreens/home/home.dart';

class Introduction extends StatefulWidget {
  Introduction({Key? key}) : super(key: key);
  static String id = 'Introduction';

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(Slide(
      title: tr(kAppName),
      description: tr(kAppDescreption),
      pathImage: "assets/images/logo.png",
      backgroundColor: Colors.white,
      styleDescription: GoogleFonts.oswald(
        textStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      styleTitle: GoogleFonts.oswald(
          textStyle: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
    ));
    slides.add(Slide(
      title: tr("MEAL"),
      description: tr("Pick Your Meal"),
      pathImage: "assets/images/main_meal.png",
      backgroundColor: Colors.grey,
      styleDescription: GoogleFonts.oswald(
        textStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      styleTitle: GoogleFonts.oswald(
          textStyle: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
    ));
    slides.add(Slide(
      title: tr("ORDER"),
      description: tr("Complete Your Order"),
      pathImage: "assets/images/order.png",
      backgroundColor: Colors.blueGrey,
      styleDescription: GoogleFonts.oswald(
        textStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      styleTitle: GoogleFonts.oswald(
          textStyle: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
    ));
  }

  void onDonePress() {
    // Do what you want
    Navigator.pushNamed(context, Home.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return IntroSlider(
      slides: slides,
      onDonePress: onDonePress,
      showPrevBtn: true,
      sizeDot: 12,
      renderNextBtn: _buildSlideButton('NEXT'.tr(), size),
      renderSkipBtn: _buildSlideButton('SKIP'.tr(), size),
      renderDoneBtn: _buildSlideButton('DONE'.tr(), size),
      nextButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      skipButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      doneButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    );
  }

  Widget _buildSlideButton(title, size) {
    return SizedBox(
      width: size.width * .2,
      height: 25,
      child: MaterialButton(
          onPressed: null,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white),
          )),
    );
  }
}
