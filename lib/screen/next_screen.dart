import 'package:c_lalzarmawia/screen/title_screen.dart';
import 'package:flutter/material.dart';

class PageTurnRoute<T> extends PageRoute<T> {
  PageTurnRoute({required this.builder}) : super();

  final WidgetBuilder builder;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.7);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 800);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final child = builder(context);
    return PageTurnBuilder(child: child, animation: animation);
  }
}

class PageTurnBuilder extends StatelessWidget {
  PageTurnBuilder({required this.child, required this.animation}) : super();

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final double angle = (1.0 - animation.value) * (-0.5 * 3.14);
    final Matrix4 transform = Matrix4.identity()
      ..setEntry(3, 2, 0.002)
      ..rotateY(angle);

    return Transform(
      alignment: Alignment.centerRight,
      transform: transform,
      child: child,
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 25, 26),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/secondb.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTurnRoute(builder: (context) => TitleScreen()),
                );
              },
              child: Text('Next Page'),
            ),
          ),
        ),
      ),
    );
  }
}
