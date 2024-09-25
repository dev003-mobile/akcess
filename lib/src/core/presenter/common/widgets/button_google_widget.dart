import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../design/app_style_design.dart';
import '../../utils/constants/app_image_constants.dart';

class ButtonGoogleWidget extends StatefulWidget {
  const ButtonGoogleWidget({
    super.key,
    this.color,
    this.onTap,
    required this.title
  });

  final String title;
  final Color? color;
  final VoidCallback? onTap;

  @override
  State<ButtonGoogleWidget> createState() => _ButtonGoogleWidgetState();
}

class _ButtonGoogleWidgetState extends State<ButtonGoogleWidget> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _opacity = 0.08),
      onTapUp: (_) => Future.delayed(const Duration(milliseconds: 150), () => setState(() => _opacity = 1.0)),
      child: AnimatedOpacity(
        curve: Curves.fastEaseInToSlowEaseOut,
        opacity: _opacity,
        duration: const Duration(milliseconds: 150),
        child: Container(
          width: size.width,
          height: size.height * .055,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.surface.withOpacity(.0),
            border: Border.all(
              width: 0.5,
              color: Theme.of(context).colorScheme.secondary.withOpacity(.3)
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(AppImageConstants.googleImage),
              SizedBox(width: size.width * .02),
              SizedBox(
                child: Text(
                  widget.title,
                  style: AppStyleDesign.fontStyleInter(
                    size: size.height * .017,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}