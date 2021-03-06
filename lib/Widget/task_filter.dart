import "package:flutter/material.dart";
import 'package:wtasks/app_color.dart';

class FiltersWidget extends StatefulWidget {
  const FiltersWidget(
      {Key? key, required this.filters, required this.updateFilter})
      : super(key: key);

  final List filters;
  final Function updateFilter;

  @override
  State<FiltersWidget> createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  String selectedFilter = "All";

  Widget _buildBadge(title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: GestureDetector(
        onTap: () {
          widget.updateFilter(title);
          setState(() {
            selectedFilter = title;
          });
        },
        child: RawChip(
          padding: const EdgeInsets.all(12.0),
          label: Text(title),
          labelStyle: TextStyle(
            color: selectedFilter == title ? Colors.white : Colors.black,
            fontSize: 14.0,
          ),
          backgroundColor: selectedFilter == title
              ? DiceModuleColor.color4Dark
              : Colors.grey[300],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.filters.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildBadge(widget.filters[index]);
        },
      ),
    );
  }
}
