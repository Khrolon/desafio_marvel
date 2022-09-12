import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marvel/app/modules/home/views/widgets/body_list_characters_widget.dart';
import 'package:marvel/app/modules/home/views/widgets/search_characters.widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('marvel_characters'.tr),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                  Get.to(
                    () => SearchCharacters(
                      controller: controller,
                    ),
                    transition: Transition.rightToLeftWithFade,
                  );
                },
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Obx(
            (() => controller.loading.value
                ? ListOfCharactersWidget(
                    characterList: controller.characterList,
                    controller: controller,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )),
          ),
        ));
  }
}
