import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  AnimationScreenState createState() => AnimationScreenState();
}

class AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Duration of the first animation
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Duration of the second animation
    );

    // Play the second animation after the first one completes
    _controller1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          _controller2.forward(); // Start the second animation
        });
      }
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/success.json', // Path to the first Lottie animation file
              controller: _controller1,
              onLoaded: (composition) {
                _controller1.duration = composition.duration;
                _controller1.repeat(); // Start the first animation
              },
            ),
            const Text('Payment Successful'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Back'))
          ],
        ),
      ),
    );
  }
}
