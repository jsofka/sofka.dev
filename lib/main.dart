import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';
import 'nameSection.dart';
import 'strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double widget1Opacity = 0.0;

  late int selectedPage;
  late final PageController controller;

  @override
  void initState() {
    selectedPage = 0;
    controller = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/purple_gradient.png',
              height: screenSize.height,
              width: screenSize.width,
              fit: BoxFit.cover,
            ),
            PageView(
              scrollDirection: Axis.vertical,
              controller: controller,
              onPageChanged: (page) {
                setState(() {
                  selectedPage = page;
                });
              },
              children: [
                Container(
                  child: Stack (
                    alignment: Alignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(milliseconds: 500),
                        child: NameSection(),
                      )
                    ]
                  )
                ),
                Container(
                  child: Stack (
                    alignment: Alignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(milliseconds: 500),
                        child: AboutMeSection(),
                      )
                    ]
                  )
                )
              ]
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  axisDirection: Axis.vertical,
                  effect: WormEffect(
                    dotColor: Colors.white,
                    activeDotColor: Colors.pinkAccent,
                  ),
                )
              )
            )
          ]
        )
      )
    );
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final scaleFactor = MediaQuery.of(context).size.width;
    return FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Row(
          children: [
             Padding(
              padding: EdgeInsets.only(left: screenSize.width / 8),
              child: Container(
                width: screenSize.width * 0.3,
                height: screenSize.height * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/name_section_profile.JPEG')
                  ),
                ),
              ),
            ),
            Padding (
              padding: EdgeInsets.symmetric(horizontal: screenSize.width / 7),
              child: Column(
                children: [
                    SizedBox(
                    width: screenSize.width * 0.3,
                    height: screenSize.height * 0.4,
                    child: AutoSizeText(
                      Strings.aboutMe,
                      maxLines: 30,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSerifDisplay(
                        textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2.0,
                          fontSize: scaleFactor * 0.02
                        )
                      ),
                    )
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.white, size: 50),
                          onPressed: () async { 
                            Uri url = Uri.parse('https://www.linkedin.com/in/jessica-sofka');

                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          }
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.github, color: Colors.white, size: 50),
                          onPressed: () async { 
                            Uri url = Uri.parse('https://github.com/jsofka');

                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}