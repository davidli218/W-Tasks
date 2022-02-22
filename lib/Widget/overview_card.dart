import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatefulWidget {
  const OverviewCard(
      {Key? key,
      required this.title,
      this.subtitle = 'Flutter',
      required this.description,
      required this.icon,
      required this.overviewImage,
      required this.openBuilder})
      : super(key: key);

  final String title;
  final String subtitle;
  final String description;
  final Widget icon;
  final ImageProvider overviewImage;
  final Widget openBuilder;

  @override
  _OverviewCardState createState() => _OverviewCardState();
}

class _OverviewCardState extends State<OverviewCard> {
  @override
  Widget build(BuildContext context) {
    const cardBorderRadius = Radius.circular(32.0);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 12.0),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        tappable: false,
        openBuilder: (context, openContainer) => widget.openBuilder,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(cardBorderRadius),
        ),
        closedColor: const Color.fromRGBO(197, 202, 208, 0.9),
        closedElevation: 0,
        closedBuilder: (context, openContainer) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: cardBorderRadius,
                  topRight: cardBorderRadius,
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image(
                    image: widget.overviewImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: openContainer,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Open",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      child: SizedBox(
                        width: 32.0,
                        height: 32.0,
                        child: widget.icon,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Powered by",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            widget.subtitle,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
