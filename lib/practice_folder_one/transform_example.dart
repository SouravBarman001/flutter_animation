
import 'package:flutter/material.dart';

class TransformExample extends StatefulWidget {
  const TransformExample({super.key});

  @override
  State<TransformExample> createState() => _TransformExampleState();
}

class _TransformExampleState extends State<TransformExample> with SingleTickerProviderStateMixin{

  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: const Duration(seconds: 2),vsync: this);

    animation = Tween(begin: -1.0,end: 0.0).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Curves.ease),
    );

  }

 double _size = 50;
  bool isBigSize = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Transform animation'),
      ),
      body: GestureDetector(
        onTap: (){
          setState(() {

            _size = _size == 300 ? 50 : 300;
            isBigSize = !isBigSize;
          });
        },
        child: Center(
          child: Container(
           // duration: const Duration(milliseconds: 600),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
              color: Colors.blueAccent,
            ),
            height: 50,
            child: AnimatedSize(duration: const Duration(seconds: 2),
               curve: Curves.linearToEaseOut,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                width: _size,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                     Visibility(
                      visible: isBigSize,
                        child: const Expanded(flex: 4,
                          child:TextField (
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                          border: InputBorder.none,
                          //labelText: 'Enter Name',
                          hintText: 'Enter Your Name',
                          hintStyle : TextStyle(
                            color: Colors.white,
                          )

                      ),
                    ),
                    ) ,),

          //   AnimatedPositionedDirectional(child: child, duration: duration)

                    Expanded(
                      flex: 1,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        child: Icon(
                        isBigSize == false ? Icons.search_rounded : Icons.search_off_rounded
                        ,size: 30,color: Colors.white,),
                      ),),
                  //  const Expanded(child: Icon(Icons.search_rounded,size: 30,color: Colors.white,),),

                  ],
                )
              ),
            ),

          ),
        ),
      ),
    );
  }
}
