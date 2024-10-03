import 'package:flutter/material.dart';

import '../design/app_style_design.dart';

class CardCheckTipWidget extends StatelessWidget {
  const CardCheckTipWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height * .12,
      margin: EdgeInsets.symmetric(horizontal: size.width * .024),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.3,
          color: Theme.of(context).colorScheme.secondary.withOpacity(.3),
        )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height * .012,
          horizontal: size.width * .022
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: SizedBox(
                child: CircleAvatar(
                  radius: size.height * .02,
                  backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(.1),
                  child: CircleAvatar(
                    radius: size.height * .015,
                    backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(.3),
                    child: Center(
                      child: Icon(
                        icon,
                        size: size.height * .02,
                        color: Theme.of(context).colorScheme.secondary
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width * .03),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * .005),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                        style: AppStyleDesign.fontStyleInter(
                          size: size.height * .015,
                          fontWeight: FontWeight.w600,
                          textOverflow: TextOverflow.clip,
                          color: Theme.of(context).colorScheme.onSurface
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .01),
                    SizedBox(
                      child: Text(
                        description,
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        style: AppStyleDesign.fontStyleInter(
                          size: size.height * .013,
                          fontWeight: FontWeight.w400,
                          textOverflow: TextOverflow.clip,
                          color: Theme.of(context).colorScheme.onSurface
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}