import 'package:flutter/material.dart';
import 'package:wtasks/app_color.dart';
import 'package:wtasks/event.dart';

class HomeContentGridView extends StatefulWidget {
  const HomeContentGridView({Key? key}) : super(key: key);

  @override
  _HomeContentGridViewState createState() => _HomeContentGridViewState();
}

class _HomeContentGridViewState extends State<HomeContentGridView> {
  final List<Event> _eventList = EventList().eventList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 5 / 3,
      ),
      itemCount: _eventList.length,
      padding: const EdgeInsets.all(5.0),
      itemBuilder: (context, index) {
        return _buildEventCard(_eventList[index]);
      },
    );
  }

  Widget _buildEventCard(Event event) {
    const borderRadius = BorderRadius.all(Radius.circular(10.0));

    return Material(
      borderRadius: borderRadius,
      child: Ink(
        decoration: const BoxDecoration(borderRadius: borderRadius),
        child: InkResponse(
          borderRadius: borderRadius,
          radius: 300.0,
          splashColor: Colors.black,
          // 圆角时裁切水波
          containedInkWell: true,
          onTap: () {
            setState(() {
              if (event.bookStatus) {
                event.bookStatus = false;
              } else {
                event.bookStatus = true;
              }
            });
          },
          child: Card(
            elevation: 5,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            color: ProjectColor.transWhiteBg,
            margin: const EdgeInsets.all(0),
            child: _buildCardContent(event),
          ),
        ),
      ),
    );
  }

  Widget _buildCardContent(Event event) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //图标
        Expanded(
          flex: 8,
          child: Stack(
            children: [
              // 旗标
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  event.bookStatus ? Icons.bookmark : Icons.bookmark_border,
                  color: event.bookStatus ? Colors.deepOrange : null,
                ),
              ),
              // 图标
              Align(
                alignment: const Alignment(-0.25, 0),
                child: event.icon,
              ),
            ],
          ),
        ),
        //文字内容
        Expanded(
          flex: 21,
          child: Column(
            children: [
              //标题
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 3),
                child: Text(
                  event.title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              //副标题
              Text(
                event.subtitle,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        //右边距
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}
