import 'package:feature_filtration/app/components/action_button.dart';
import 'package:feature_filtration/app/components/grey_pill.dart';
import 'package:feature_filtration/app/components/other_feature_card.dart';
import 'package:feature_filtration/app/components/search_field.dart';
import 'package:feature_filtration/app/components/top_feature_card.dart';
import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({
    Key? key,
    required this.onSearch,
    required this.searchStarted,
    required this.topFeatures,
    required this.otherFeatures,
  }) : super(key: key);

  final void Function(String)? onSearch;
  final bool searchStarted;
  final List<TopFeatureCard> topFeatures;
  final List<OtherFeatureCard> otherFeatures;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade400, blurRadius: 20),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: GreyPill()),
          SearchField(onChanged: onSearch),
          const SizedBox(height: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!searchStarted) ...[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Top Features', style: Theme.of(context).textTheme.titleLarge),
                        const ActionButton(icon: Icons.settings),
                      ],
                    ),
                  ),

                  //Top features
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: topFeatures,
                    ),
                  ),
                  const Divider(thickness: 1.25, color: Colors.grey, indent: 8, endIndent: 8)
                ],

                //Other features
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      children: otherFeatures,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
