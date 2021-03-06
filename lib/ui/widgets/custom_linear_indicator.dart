import 'package:flutter/material.dart';
import 'package:showwcase_pokemon/shared/app_colors.dart';

class ProgressBar extends StatelessWidget {

  final num current;
  final Color color;

  const ProgressBar(
      {Key? key,
        required this.current,
        required this.color })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, boxConstraints) {
        var x = boxConstraints.maxWidth;
        var percent = (current / 100) * x;
        return Stack(
          children: [
            Container(
              width: x,
              height: 5,
              decoration: BoxDecoration(
                color: mecuryGrey,
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: percent,
              height: 5,
              decoration: BoxDecoration(
                color: current < 40 ? cerisePink :  current >= 40 && current < 70 ? goldTipsYellow : Colors.green  ,
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          ],
        );
      },
    );
  }
}
