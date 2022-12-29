import 'package:feature_filtration/app/components/action_button.dart';
import 'package:feature_filtration/app/components/my_avatar.dart';
import 'package:feature_filtration/app/components/my_bottom_sheet.dart';
import 'package:feature_filtration/app/components/other_feature_card.dart';
import 'package:feature_filtration/app/components/top_feature_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: ActionButton(icon: Icons.notifications_active),
        ),
        title: Image.network(
          'https://1000logos.net/wp-content/uploads/2018/02/Ford-Logo.png',
          width: 120,
        ),
        actions: const [
          MyAvatar(
            imageUrl:
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          ),
        ],
      ),
      body: const Center(child: Text('Hello World')),

      /// Below Builder is used to get the Scaffold inside this build method
      /// If we do not use Builder here, it will try to pick Scaffold from where HomeView widget is called
      bottomNavigationBar: Builder(builder: (context) {
        return Obx(() {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              controller.selectedTabIndex.value = index;
              controller.toggleBottomSheet(
                showBottomSheet: index == 2,
                onShowBottomSheet: () {
                  Scaffold.of(context).showBottomSheet(
                    (ctx) {
                      return Obx(() {
                        return MyBottomSheet(
                          searchStarted: controller.whatToSearch.value.trim().isNotEmpty,
                          onSearch: (value) => controller.whatToSearch.value = value,
                          topFeatures: List.generate(
                            controller.topFeatures.length,
                            (index) {
                              final feature = controller.topFeatures[index];
                              return TopFeatureCard(feature: feature);
                            },
                          ),
                          otherFeatures: List.generate(
                            controller.searchResult.length,
                            (index) {
                              final feature = controller.searchResult[index];
                              return OtherFeatureCard(feature: feature);
                            },
                          ),
                        );
                      });
                    },
                    transitionAnimationController: controller.bottomSheetController,
                  );
                },
              );
            },
            unselectedItemColor: Colors.indigoAccent.withOpacity(0.3),
            selectedItemColor: Colors.indigoAccent,
            showUnselectedLabels: true,
            currentIndex: controller.selectedTabIndex.value,
            elevation: 0,
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              const BottomNavigationBarItem(icon: Icon(Icons.thumb_up), label: 'Connect'),
              BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent.withOpacity(0.3),
                        borderRadius: const BorderRadius.all(Radius.circular(15))),
                    child: Icon(
                      controller.isBottomSheetOpened.value ? Icons.close : Icons.apps,
                      size: 30,
                      color: controller.isBottomSheetOpened.value ? Colors.black : Colors.indigoAccent,
                    ),
                  ),
                  label: ''),
              const BottomNavigationBarItem(icon: Icon(Icons.tips_and_updates), label: 'Evolve'),
              const BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
            ],
          );
        });
      }),
    );
  }
}
