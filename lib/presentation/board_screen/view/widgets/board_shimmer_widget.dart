import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StatusCardShimmer extends StatelessWidget {
  const StatusCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 350,
        margin: const EdgeInsets.all(24.0),
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6.0),
                height: 45,
                decoration: const BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              );
            }),
        ),
      ),
    );
  }
}
