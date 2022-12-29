import 'package:feature_filtration/app/data/entity/feature_item.dart';
import 'package:flutter/material.dart';

class DummyData {
  DummyData._();
  static final DummyData instance = DummyData._();

  List<FeatureItem> topFeatures = [
    FeatureItem('Physical Wellness', Icons.monitor_heart, Colors.red),
    FeatureItem('ID Cards', Icons.contact_mail, Colors.blueGrey),
    FeatureItem('Paystubs', Icons.payments, Colors.green),
    FeatureItem('PTC', Icons.beach_access, Colors.red),
    FeatureItem('Upcoming Features', Icons.upcoming, Colors.blueGrey),
  ];

  List<FeatureItem> otherFeatures = [
    FeatureItem('Activity Tracker', Icons.monitor_heart, Colors.red),
    FeatureItem('Adovacy', Icons.note_add_sharp, Colors.blueGrey),
    FeatureItem('Benefits Hub', Icons.public, Colors.lightBlue),
    FeatureItem('Company Intranet', Icons.language, Colors.lightBlue),
    FeatureItem('DEI Programs', Icons.hourglass_bottom, Colors.blueGrey),
    FeatureItem('Employee Support', Icons.forum, Colors.grey.shade700),
    FeatureItem('Financial', Icons.folder, Colors.yellow.shade800),
    FeatureItem('Feedback Center', Icons.mail, Colors.red),
    FeatureItem('Feature', Icons.tips_and_updates, Colors.yellow.shade800),
    FeatureItem('Feature', Icons.radar, Colors.red),
    FeatureItem('Financial', Icons.payments, Colors.green),
    FeatureItem('Onboarding', Icons.handshake, Colors.yellow.shade800),
    FeatureItem('Feature', Icons.featured_play_list, Colors.blueGrey),
    FeatureItem('Feature', Icons.category, Colors.blueGrey),
  ];
}