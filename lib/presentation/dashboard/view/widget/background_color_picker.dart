import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

class BoardBackgroundPicker extends StatelessWidget {
  BoardBackgroundPicker({super.key});

  final List<Color> colors = [
    const Color(0xff0079BF),
    const Color(0xffD29034),
    const Color(0xff519839),
    const Color(0xffB04632),
    const Color(0xff89609E),
    const Color(0xffCD5A91),
    const Color(0xff00AECC),
    const Color(0xff838C91),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Background',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: AppColors.mainTextColor,
          ),
        ),
        const SizedBox(height: 10.0),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.25
          ),
          shrinkWrap: true,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: colors[index],
                borderRadius: const BorderRadius.all(Radius.circular(8.0))
              ),
            );
          },
        ),
      ],
    );
  }
}
