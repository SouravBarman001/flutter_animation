import 'package:flutter/material.dart';

/* --------Guidelines----------
* 1. Make StatefulWidget
* 2. Add SingleTickerProviderStateMixin
* 3. Declare Animation and Controller
* 4. Make initState and add functionality. You have to need basic of (vsync and ticker)
* 5. Animation triggered using : animationController.forward()
* 6. we need to dispose the animation when we go to other screen : animationController.dispose();
* 7. delayed animation using Interval
* */

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> with SingleTickerProviderStateMixin {

  late Animation animation,countAnimation;
  late AnimationController animationController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: const Duration(seconds: 5), vsync: this);

    // Tween -1 to 0 = left to right
    // Tween 1 to 0 = right to left

    animation = Tween(begin: -1 ,end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve:  const Interval(0.1,1.0,curve: Curves.decelerate)));

    countAnimation = IntTween(begin: 0 ,end: 100).animate(CurvedAnimation(
        parent: animationController,
        curve:  const Interval(0.1,1.0,curve: Curves.decelerate)));

    //
    // delayedAnimation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
    //     parent: animationController,
    //     curve: const Interval(0.5,1.0,curve: Curves.decelerate)));

    animationController.forward();
    // triggered the animation
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("LoadingAnimation "),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text('Loading....${countAnimation.value}',style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),),
              const SizedBox(height: 15,),
              Container(
               // margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                width: double.infinity,
                color: Colors.blueAccent,
                child: Transform(
                  transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                  child: AnimatedContainer(
                   // margin: const EdgeInsets.symmetric(horizontal: 15),
                    duration: const Duration(seconds: 4),
                   // width: double.infinity,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              countAnimation.value == 100 ? const Text('Completed',) : const Text(''),
            ],
          ),
        );
      },
    );
  }
}
