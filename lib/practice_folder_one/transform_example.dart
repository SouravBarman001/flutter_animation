import 'package:flutter/material.dart';

class Transform extends StatefulWidget {
  const Transform({super.key});

  @override
  State<Transform> createState() => _TransformState();
}

class _TransformState extends State<Transform> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  IconData _buttonIcon = Icons.play_arrow;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  void onPressedHandler() {
    if (animationController.isDismissed) {
      animationController.forward();
      setState(() {
        _buttonIcon = Icons.arrow_back;
      });
    } else {
      animationController.reverse();
      setState(() {
        _buttonIcon = Icons.play_arrow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transform"),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: MainContent(animationController),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: onPressedHandler,
        child: Icon(
          _buttonIcon,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
}

class RedContainer extends StatelessWidget {
  const RedContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 250,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Center(
            child: Text(
              'TEST',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}
