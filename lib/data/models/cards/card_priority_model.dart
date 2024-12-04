import 'package:flutter/material.dart';

class CardPriority {
  int? id;
  String? label;
  Widget? icon;

  CardPriority({
    this.id,
    this.label,
    this.icon,
  });
}

List<CardPriority> cardPriorityList = [
  CardPriority(
      id: 1,
      label: 'Low',
      icon: const Icon(
        Icons.expand_more,
        color: Colors.blue,
      )),
  CardPriority(
      id: 2,
      label: 'Medium',
      icon: const Icon(
        Icons.drag_handle,
        color: Colors.yellow,
      )),
  CardPriority(
      id: 3,
      label: 'High',
      icon: const Icon(
        Icons.keyboard_double_arrow_up,
        color: Colors.orange,
      )),
  CardPriority(
      id: 4,
      label: 'Major',
      icon: Transform.rotate(
        angle: 4.67,
        child: const Icon(
          Icons.label_important,
          color: Colors.red,
        ),
      )),
  CardPriority(
      id: 5,
      label: 'Blocker',
      icon: Icon(
        Icons.remove_circle,
        color: Colors.red[900],
      )),
];
