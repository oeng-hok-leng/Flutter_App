import 'package:flutter/material.dart';
import 'package:your_weather/Views/widgets/text_widget.dart';

class StatisticWidget extends StatelessWidget {
  const StatisticWidget(
      {Key? key,
      required this.description,
      required this.icon,
      required this.data})
      : super(key: key);

  final String description;
  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.35,
      // color: Colors.red,
      height: 80,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            child: Icon(icon, color: Colors.black.withOpacity(0.7), size: 28),
            backgroundColor: Colors.grey.withOpacity(0.4),
            radius: 24,
          ),
          // const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: description,
                size: 12,
                color: Colors.black.withOpacity(0.6),
              ),
              const SizedBox(height: 5),
              TextWidget(
                text: data,
                isbold: true,
                size: 24,
              ),
            ],
          )
        ],
      ),
    );
  }
}
