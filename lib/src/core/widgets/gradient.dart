import 'package:flutter/material.dart';

// Method 1: Using ShaderMask for gradient opacity
class GradientOpacityWidget extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  final List<double>? stops;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const GradientOpacityWidget({
    Key? key,
    required this.child,
    required this.colors,
    this.stops,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: begin,
          end: end,
          colors: colors,
          stops: stops,
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }
}

// Method 2: Stack with gradient container overlay
class GradientOverlay extends StatelessWidget {
  final Widget child;
  final List<Color> gradientColors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const GradientOverlay({
    Key? key,
    required this.child,
    required this.gradientColors,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: begin,
                end: end,
                colors: gradientColors,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Method 3: Custom painter for advanced gradient effects
class GradientOpacityPainter extends CustomPainter {
  final List<Color> colors;
  final List<double>? stops;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  GradientOpacityPainter({
    required this.colors,
    this.stops,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradient = LinearGradient(
      begin: begin,
      end: end,
      colors: colors,
      stops: stops,
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..blendMode = BlendMode.dstIn;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Method 4: Radial gradient opacity
class RadialGradientOpacity extends StatelessWidget {
  final Widget child;
  final double radius;
  final List<Color> colors;
  final AlignmentGeometry center;

  const RadialGradientOpacity({
    Key? key,
    required this.child,
    this.radius = 1.0,
    required this.colors,
    this.center = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: center,
          radius: radius,
          colors: colors,
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }
}

// Example usage page
class GradientOpacityExamples extends StatelessWidget {
  const GradientOpacityExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Example 1: Text with gradient opacity
            Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: GradientOpacityWidget(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.5),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  child: const Text(
                    'GRADIENT\nOPACITY\nTEXT',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            // Example 2: Image with fade-out effect
            Container(
              height: 300,
              margin: const EdgeInsets.all(20),
              child: GradientOpacityWidget(
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white.withOpacity(0.0),
                ],
                stops: const [0.0, 0.7, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/400/300'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // Example 3: Horizontal gradient fade
            Container(
              height: 100,
              margin: const EdgeInsets.all(20),
              child: GradientOpacityWidget(
                colors: const [
                  Colors.transparent,
                  Colors.white,
                  Colors.white,
                  Colors.transparent,
                ],
                stops: const [0.0, 0.2, 0.8, 1.0],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Example 4: Radial gradient opacity
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.all(20),
              child: RadialGradientOpacity(
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.5),
                  Colors.transparent,
                ],
                radius: 0.8,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.star, size: 80, color: Colors.white),
                  ),
                ),
              ),
            ),

            // Example 5: Complex gradient with multiple stops
            Container(
              height: 400,
              margin: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  // Background content
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.shade800,
                          Colors.purple.shade800,
                          Colors.pink.shade800,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          10,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'Line ${index + 1}: Lorem ipsum dolor sit amet',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Gradient overlay at top
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 100,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                        ),
                      ),
                    ),
                  ),
                  // Gradient overlay at bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 100,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black, Colors.transparent],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Example 6: Animated gradient opacity
            const AnimatedGradientOpacity(),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// Animated gradient opacity widget
class AnimatedGradientOpacity extends StatefulWidget {
  const AnimatedGradientOpacity({super.key});

  @override
  _AnimatedGradientOpacityState createState() =>
      _AnimatedGradientOpacityState();
}

class _AnimatedGradientOpacityState extends State<AnimatedGradientOpacity>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(20),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return GradientOpacityWidget(
            colors: [
              Colors.white.withOpacity(_animation.value),
              Colors.white,
              Colors.white.withOpacity(_animation.value),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.orange, Colors.red, Colors.purple],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'ANIMATED\nGRADIENT',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Utility function for creating text with gradient opacity
Widget fadeText(String text, {TextStyle? style}) {
  return GradientOpacityWidget(
    colors: const [
      Colors.transparent,
      Colors.white,
      Colors.white,
      Colors.transparent,
    ],
    stops: const [0.0, 0.1, 0.9, 1.0],
    child: Text(text, style: style ?? const TextStyle(fontSize: 16)),
  );
}

// Custom gradient mask for icons
class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final List<Color> colors;

  const GradientIcon({
    Key? key,
    required this.icon,
    this.size = 24,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(colors: colors).createShader(bounds);
      },
      child: Icon(icon, size: size, color: Colors.white),
    );
  }
}
