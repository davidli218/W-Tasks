import 'package:flutter/material.dart';

class ProjectAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ProjectAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.leadingWidth,
    this.subPageMode,
  })  : preferredSize = (subPageMode ?? false)
            ? const Size.fromHeight(titleHeight + subPageDividerHeight)
            : const Size.fromHeight(titleHeight + standardDividerHeight),
        super(key: key);

  static const titleHeight = 42.0;
  static const standardDividerHeight = 24.0;
  static const subPageDividerHeight = 12.0;

  /// The title displayed in the app bar.
  final String title;

  /// A widget to display before the toolbar's title.
  final Widget? leading;

  /// Defines the width of [leading] widget.
  ///
  /// By default, the value of `leadingWidth` is 56.0.
  final double? leadingWidth;

  final bool? subPageMode;

  /// [Scaffold] uses this size to set its app bar's height.
  @override
  final Size preferredSize;

  @override
  State<ProjectAppBar> createState() => _ProjectAppBarState();
}

class _ProjectAppBarState extends State<ProjectAppBar> {
  @override
  Widget build(BuildContext context) {
    Widget? leading = widget.leading;
    if (leading != null) {
      leading = ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: widget.leadingWidth ?? kToolbarHeight),
        child: leading,
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                (leading == null) ? const SizedBox(width: 20.0) : leading,
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Divider(
              height: (widget.subPageMode ?? false)
                  ? ProjectAppBar.subPageDividerHeight
                  : ProjectAppBar.standardDividerHeight,
              thickness: 1.0,
              indent: 32.0,
              endIndent: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
