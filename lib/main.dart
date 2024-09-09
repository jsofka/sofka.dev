import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

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

  void changeOpacity() async{
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() => widget1Opacity = 1.0);
  }

  @override
  void initState() {
    changeOpacity();
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
      body: ScrollTransformView(
        children: [
          ScrollTransformItem(
            builder: (scrollOffset) {
              return Image.asset(
                'purple_gradient.png',
                height: screenSize.height,
                width: screenSize.width,
                fit: BoxFit.cover,
              );
            },
          ),
          ScrollTransformItem(
            builder: (scrollOffset) {
              return AnimatedOpacity(
                opacity: widget1Opacity,
                duration: const Duration(milliseconds: 500),
                child: NameSection(),
              );
            },
            offsetBuilder: (scrollOffset) => Offset(0, -screenSize.height / 2), // Center vertically
          ),
        ]
      )
    );
  }
}

class NameSection extends StatelessWidget {
  const NameSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: AutoSizeText(
          "Hi! I'm Jessica\n Website coming soon!",
          textAlign: TextAlign.center,
          style: GoogleFonts.dmSerifDisplay(
            textStyle: const TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
            )
          ),
          minFontSize: 40,
          maxFontSize: 80,
        )
    );
  }
}