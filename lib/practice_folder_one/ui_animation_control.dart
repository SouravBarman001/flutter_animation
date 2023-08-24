import 'package:flutter/material.dart';

class UIAnimationControl extends StatefulWidget {
  const UIAnimationControl({super.key});

  @override
  State<UIAnimationControl> createState() => _UIAnimationControlState();
}

class _UIAnimationControlState extends State<UIAnimationControl> with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this);

    // Tween -1 - 0 - 1 = top to middle to bottom
    animation = Tween(begin: 0.0 ,end: -0.15).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn));

   // animationController.forward(); // triggered the animation
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
            title: const Text("UIAnimationControl"),
          ),
          body: Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 350.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        ElevatedButton(
                            onPressed: (){}, child: const Text('Buy')),

                        ElevatedButton(
                            onPressed: (){}, child: const Text('Details')),

                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                   animationController.forward();
                  },
                  onDoubleTap: (){
                    animationController.reverse();

                  },
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 350.0,
                      width: width * .9,
                      decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[10],
                       // color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: NetworkImage(
                           'https://static1.xdaimages.com/wordpress/wp-content/uploads/2023/06/macbook-air-15-inch-xda01592-2.jpg',
                          ),
                          fit: BoxFit.cover,
                        )
                      ),
                      transform: Matrix4.translationValues(0.0, animation.value * width, 0.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
