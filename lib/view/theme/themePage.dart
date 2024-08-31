
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/get_x_controller.dart';
import 'components/theme_component.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    GetController getController = Get.put(GetController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(
        () => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(getController
                      .imagesThemes[getController.imageSelectIndex.value]),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                  colorFilter: const ColorFilter.srgbToLinearGamma())),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.022,
                ),
                popThemesPageHeaderPadding(width),
                Obx(
                  () => themesCarouselSlider(getController, height),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        "Fonts",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: getController.fonts[8]),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            getController.selectOpenAndClosedBoolMethod(
                                getController.fontOpenAndClosedBool);
                          },
                          icon: (getController.fontOpenAndClosedBool.value)
                              ? Icon(Icons.keyboard_arrow_up)
                              : Icon(Icons.keyboard_arrow_down))
                    ],
                  ),
                ),
                (getController.fontOpenAndClosedBool.value == true)
                    ? fontsPaddingSlide(getController)
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
