import 'package:feature_filtration/app/data/dummy_data/features.dart';
import 'package:feature_filtration/app/data/entity/feature_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  /// This is to store all the top features
  List<FeatureItem> topFeatures = DummyData.instance.topFeatures;

  /// This is to store all the other features
  List<FeatureItem> otherFeatures = DummyData.instance.otherFeatures;

  /// This variable is taken to identify which [BottomNavigationBarItem] is selected
  RxInt selectedTabIndex = 0.obs;

  /// This variable is taken to identify whether the [BottomSheet] is opened or not
  RxBool isBottomSheetOpened = false.obs;

  /// This controller is taken to control i.e, close the bottomSheet
  AnimationController? bottomSheetController;

  /// This variable is to store what user is searching for,
  /// and this Rx is to update the search result
  RxString whatToSearch = ''.obs;

  /// This method will check whether the bottom sheet is already opened or not
  /// If already opened, then it will close the sheet with the help of [bottomSheetController]
  /// If not opened, it will execute [onShowBottomSheet] that will show the bottom sheet
  toggleBottomSheet({
    bool showBottomSheet = false,
    required Function() onShowBottomSheet,
  }) {
    if (isBottomSheetOpened.value) {
      bottomSheetController?.animateTo(0);
      isBottomSheetOpened(false);
    } else if (showBottomSheet) {
      onShowBottomSheet();
      isBottomSheetOpened(true);
    }
  }

  /// Below is the getter to populate search result according
  /// to the value of [whatToSearch] on [topFeatures]
  /// It will work with Obx in the View because
  /// this getter is depends on Rx variable [whatToSearch]
  List<FeatureItem> get searchResult {
    if (whatToSearch.value.trim().isEmpty) {
      return otherFeatures;
    } else {
      return otherFeatures.where((element) {
        return element.title.toLowerCase().contains(whatToSearch.value.trim().toLowerCase());
      }).toList();
    }
  }

  @override
  void onInit() {
    /// initializing bottomSheetController
    bottomSheetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    /// adding listener to the BottomSheet, to check when BottomSheet is closed by any other mean,
    /// i.e, drag or using device back button, then setting isBottomSheetOpened to false
    bottomSheetController?.addListener(() {
      if (bottomSheetController?.status == AnimationStatus.reverse) {
        isBottomSheetOpened(false);
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    bottomSheetController?.dispose();
    super.onClose();
  }
}
