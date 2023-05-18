import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DissertationShimmerWidget extends StatelessWidget {
  const DissertationShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: const BoxDecoration(
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.black.withOpacity(0.05),
            highlightColor: Colors.black.withOpacity(0.1),
            child: Container(
              width: 200,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white
              ),
            ),
          ),
          const SizedBox(height: 4),
          Shimmer.fromColors(
            baseColor: Colors.black.withOpacity(0.05),
            highlightColor: Colors.black.withOpacity(0.1),
            child: Container(
              width: 250,
              height: 24,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.black.withOpacity(0.05),
                highlightColor: Colors.black.withOpacity(0.1),
                child: Container(
                  width: 50,
                  height: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Shimmer.fromColors(
                baseColor: Colors.black.withOpacity(0.05),
                highlightColor: Colors.black.withOpacity(0.1),
                child: Container(
                  width: 100,
                  height: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
