import 'package:flutter/material.dart';

class OverviewCard extends StatefulWidget {
  const OverviewCard(
      {Key? key,
      required this.moduleTitle,
      this.moduleSubtitle = '',
      required this.moduleDescription,
      required this.moduleIcon,
      required this.moduleOverviewImage,
      required this.moduleRouteName})
      : super(key: key);

  final String moduleTitle;
  final String moduleSubtitle;
  final String moduleDescription;
  final IconData moduleIcon;
  final ImageProvider moduleOverviewImage;
  final String moduleRouteName;

  @override
  _OverviewCardState createState() => _OverviewCardState();
}

class _OverviewCardState extends State<OverviewCard> {
  @override
  Widget build(BuildContext context) {
    const cardBorderRadius = Radius.circular(32.0);

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(cardBorderRadius),
      ),
      shadowColor: Colors.transparent,
      color: const Color.fromRGBO(197, 202, 208, 0.9),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: cardBorderRadius,
              topRight: cardBorderRadius,
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image(
                image: widget.moduleOverviewImage,
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
                          widget.moduleTitle,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.moduleDescription,
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
                  onPressed: () {
                    Navigator.of(context).pushNamed(widget.moduleRouteName);
                  },
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
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: ColoredBox(
                    color: Colors.indigo,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Icon(
                        widget.moduleIcon,
                        size: 28.0,
                        color: Colors.white,
                      ),
                    ),
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
                        widget.moduleSubtitle,
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
      ),
    );
  }
}
