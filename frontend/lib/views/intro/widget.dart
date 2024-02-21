part of 'controller.dart';

class CircleImage extends StatefulWidget {
  final Alignment alignment;
  final double radius;
  final int? position;
  const CircleImage({
    super.key,
    required this.alignment,
    required this.radius,
    this.position,
  });

  @override
  State<CircleImage> createState() => _CircleImageState();
}

class _CircleImageState extends State<CircleImage> {
  Widget body() => Container(
        height: (widget.radius * 2).r,
        width: (widget.radius * 2).r,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.face,
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: widget.position == null
          ? body()
          : body()
              .animate(delay: ((6 / widget.position!) * 0.2).seconds)
              .scale(duration: 1.seconds),
    );
  }
}