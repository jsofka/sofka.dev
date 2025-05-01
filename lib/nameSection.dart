import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'strings.dart';

class NameSection extends StatelessWidget {
  const NameSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final scaleFactor = MediaQuery.of(context).size.width;
    return FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Column (
              children: [
                Padding (
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width / 8),
                  child: AutoSizeText(
                    Strings.hiImJessica,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSerifDisplay(
                      textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: scaleFactor * 0.05
                      )
                    ),
                  )
                ),
                const SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: scaleFactor * 0.07),
                  child: AnimatedTextKit(
                    repeatForever: true, 
                    animatedTexts: [
                      RotateAnimatedText(
                        Strings.engineer, 
                        transitionHeight: scaleFactor * 0.07,
                        textStyle: GoogleFonts.dmSerifDisplay(
                          textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontSize: scaleFactor * 0.04,
                            fontStyle: FontStyle.italic
                          )
                        )
                      ),
                      RotateAnimatedText(
                        Strings.designer, 
                        transitionHeight: scaleFactor * 0.07,
                        textStyle: GoogleFonts.dmSerifDisplay(
                          textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontSize: scaleFactor * 0.04,
                             fontStyle: FontStyle.italic
                          )
                        )
                      ),
                      RotateAnimatedText(
                        Strings.learner, 
                        transitionHeight: scaleFactor * 0.07,
                        textStyle: GoogleFonts.dmSerifDisplay(
                          textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontSize: scaleFactor * 0.04,
                             fontStyle: FontStyle.italic
                          )
                        ),
                      )
                    ],
                  ),
                )
              ]
            ),
            Padding(
              padding: EdgeInsets.only(right: screenSize.width / 8),
              child: Container(
                width: screenSize.height * 0.3,
                height: screenSize.height * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/profile.JPG')
                  ),
                ),
              ),
            )
          ]
        )
    );
  }
}