import 'package:flutter/material.dart';
import 'package:techara_merchant/src/core/widgets/custom_image_widget.dart';

class SingleFocusCarousel extends StatefulWidget {
  final List<String> images;

  const SingleFocusCarousel({super.key, required this.images});

  @override
  State<SingleFocusCarousel> createState() => _SingleFocusCarouselState();
}

class _SingleFocusCarouselState extends State<SingleFocusCarousel> {
  final CarouselController controller = CarouselController(initialItem: 1);

  @override
  void initState() {
    super.initState();
    // Make room to show side items (like 80px previews)
  }

  @override
  Widget build(BuildContext context) {
    return CarouselView(
      controller: controller,
      itemSnapping: false,
      // flexWeights: const <int>[3, 8, 3],
      itemExtent: 263,
      children: widget.images.map((image) {
        return CustomImageWidget(key: ValueKey(image), imageUrl: image);
      }).toList(),
    );
  }
}
