import 'package:feature_filtration/app/data/entity/feature_item.dart';
import 'package:flutter/material.dart';

class TopFeatureCard extends StatelessWidget {
  const TopFeatureCard({
    Key? key,
    required this.feature,
  }) : super(key: key);

  final FeatureItem feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(feature.icon, color: feature.iconColor, size: 30,),
          const SizedBox(height: 8),
          Text(
            feature.title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
