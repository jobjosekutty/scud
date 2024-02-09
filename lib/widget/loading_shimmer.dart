import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Shimmerloader extends StatefulWidget {
  const Shimmerloader({Key? key}) : super(key: key);

  @override
  State<Shimmerloader> createState() => _ShimmerloaderState();
}

class _ShimmerloaderState extends State<Shimmerloader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 45,
        ),
        top(),
        const SizedBox(
          height: 45,
        ),
        top(),
        const SizedBox(
          height: 45,
        ),
        middle(),
        const SizedBox(
          height: 45,
        ),
        bottom()
      ],
    ));
  }

  Shimmer rowbutton() {
    return Shimmer(
      duration: const Duration(milliseconds: 500),
      interval: const Duration(milliseconds: 500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            height: 24,
            width: 74,
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            height: 24,
            width: 74,
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 24,
            width: 74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 24,
            width: 74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  Expanded bottom() {
    return Expanded(
      child: Shimmer(
        duration: const Duration(milliseconds: 500),
        interval: const Duration(milliseconds: 500),
        color: Colors.white,
        colorOpacity: 0.7,
        enabled: true,
        direction: const ShimmerDirection.fromLTRB(),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              height: 70,
              width: double.infinity,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Padding middle() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Shimmer(
          duration: const Duration(milliseconds: 500),
          interval: const Duration(milliseconds: 500),
          color: Colors.white,
          colorOpacity: .7,
          enabled: true,
          direction: const ShimmerDirection.fromLTRB(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                height: 160,
                width: 160,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                height: 160,
                width: 160,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                height: 160,
                width: 160,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                height: 160,
                width: 160,
              )
            ],
          ),
        ),
      ),
    );
  }

  Shimmer top() {
    return Shimmer(
        duration: const Duration(milliseconds: 500),
        interval: const Duration(milliseconds: 500),
        color: Colors.white,
        colorOpacity: 0.7,
        enabled: true,
        direction: const ShimmerDirection.fromLTRB(),
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          height: 120,
          width: double.infinity,
          color: Colors.grey[300],
        ));
  }
}
