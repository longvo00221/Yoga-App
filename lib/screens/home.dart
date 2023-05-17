import 'package:flutter/material.dart';
import 'package:flutter_animated_starter/helper/colors.dart';
import 'package:flutter_animated_starter/screens/getstarted.dart';
import 'package:flutter_animated_starter/widgets/backgroundcircle.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _isContainerVisible = false;
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      _updatesize();
    });
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
        reverseDuration: Duration(seconds: 2))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) controller.reverse();
        if (status == AnimationStatus.dismissed) controller.forward();
      });
    controller.forward();
  }

  void _updatesize() {
    setState(() {
      _isContainerVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final res_width = MediaQuery.of(context).size.width;
    final res_height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: res_height * 0.1),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
            height: _isContainerVisible ? res_width * 0.9 : 0.0,
            width: _isContainerVisible ? res_width * 0.9 : 0.0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                BackgroundCircle(
                    circleBorderWidth: 80.0,
                    circleColor: Colors.grey,
                    circleOpacity: 0.1,
                    circleWidth: res_width * 0.9),
                BackgroundCircle(
                    circleBorderWidth: 40.0,
                    circleColor: Colors.grey,
                    circleOpacity: 0.2,
                    circleWidth: res_width * 0.8),
                SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(0, -0.15), end: Offset(0, 0.15))
                      .animate(controller),
                  child: Image.asset('assets/images/character-2.png'),
                )
              ],
            ),
          ),
          SizedBox(height: res_height * 0.1),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(
                "The time that leads to mastery í dependent on the intensity of our focus",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .merge(TextStyle(color: Colors.grey))),
          ),
          SizedBox(
            height: res_height*0.1,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
                
              },
              child: Container(
                width: res_width * 0.32,
                decoration: BoxDecoration(
                  color: kprimarycolor,
                  borderRadius: BorderRadius.all(Radius.circular(13))
                ),
                child: Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restart_alt,color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Restart",
                        style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .merge(TextStyle(color:Colors.white)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
