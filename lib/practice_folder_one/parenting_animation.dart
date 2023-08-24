import 'package:flutter/material.dart';

/* --------Guidelines----------
* 1. Make StatefulWidget
* 2. Add SingleTickerProviderStateMixin
* 3. Declare Animation and Controller
* 4. Make initState and add functionality. You have to need basic of (vsync and ticker)
* 5. Animation triggered using : animationController.forward()
* 6. We need to dispose the animation when we go to other screen : animationController.dispose();
* 7. Delayed animation using Interval
* 8. Need Two animation for parenting animation
* */

class ParentingAnimation extends StatefulWidget {
  const ParentingAnimation({super.key});

  @override
  State<ParentingAnimation> createState() => _ParentingAnimationState();
}

class _ParentingAnimationState extends State<ParentingAnimation> with SingleTickerProviderStateMixin {

  late Animation animation,childAnimation;
  late AnimationController animationController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: const Duration(seconds: 3), vsync: this);

    // Tween -1 to 0 = left to right
    // Tween 1 to 0 = right to left

    animation = Tween(begin: .6 ,end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn));

    childAnimation = Tween(begin: 10.0,end: 125.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.1,1,curve: Curves.easeIn)));

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
    final double height = MediaQuery.of(context).size.height;

    animationController.forward(); // triggered the animation

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Parenting Animation"),
          ),
          body: Container(
            child: Transform(
              transform: Matrix4.translationValues(0.0, animation.value * height, 5.0),
              child: AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget? child) {
                  return Container(
                    height: childAnimation.value * 4,
                    width: childAnimation.value * 4,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 110.0),
                          child: Center(
                            child: Container(
                                width: 200,
                                height: 100,
                                /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                                child: const Icon(Icons.facebook,size: 100,color: Colors.blue,)),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Padding(
                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Phone number, email or username',
                                hintText: 'Enter valid email id as abc@gmail.com'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          //padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(

                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Enter secure password'),
                          ),
                        ),

                        SizedBox(
                          height: 65,
                          width: 360,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal:16),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ElevatedButton(
                                child: const Text( 'Log in ', style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: (){
                                  print('Successfully log in ');
                                },

                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                            child: Center(
                              child: Row(
                                children: [

                                  const Padding(
                                    padding: EdgeInsets.only(left: 62),
                                    child: Text('Forgot your login details? '),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left:1.0),
                                    child: InkWell(
                                        onTap: (){
                                          print('hello');
                                        },
                                        child: const Text('Get help logging in.', style: TextStyle(fontSize: 14, color: Colors.blue),)),
                                  )
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
