import 'package:feature_filtration/app/data/entity/feature_item.dart';
import 'package:flutter/material.dart';

class OtherFeatureCard extends StatelessWidget {
  const OtherFeatureCard({
    Key? key,
    required this.feature,
  }) : super(key: key);

  final FeatureItem feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Icon(feature.icon, color: feature.iconColor, size: 30),
          const SizedBox(width: 16),
          Flexible(child: Text(feature.title)),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
