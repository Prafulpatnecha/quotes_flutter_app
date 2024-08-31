
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glowy_borders/glowy_borders.dart';
import '../../../controller/get_x_controller.dart';

//TODO Bottom Sheet Themes Changes
Future<dynamic> themesShowModalBottomSheet(BuildContext context, double height, GetController getController) {
  return showModalBottomSheet(
    context: context,
    showDragHandle: true,
    builder: (context) {
      return SizedBox(
        height: height*0.9,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  children: [
                    ...List.generate(
                      getController.imagesThemes.length,
                          (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            getController.selectIndexMethod(index: index, setIndex: getController.imageSelectIndex);
                          },
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(image: AssetImage(getController.imagesThemes[index]),fit: BoxFit.cover)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// TODO Theme Image Sliding View and Colors animation Also have Available This Method.
CarouselSlider themesCarouselSlider(GetController getController, double height) {
  return CarouselSlider.builder(
    itemCount: getController.imagesThemes.length,
    itemBuilder: (context, index, realIndex) {
      return GestureDetector(
        onLongPress: () {
          themesShowModalBottomSheet(context, height, getController);
        },
        onTap: () {
          getController.selectIndexMethod(
              index: index,
              setIndex: getController.imageSelectIndex);
        },
        child: AnimatedGradientBorder(
          glowSize: 3,
          gradientColors: [
            Colors.purple,
            Colors.transparent,
            Colors.red,
            Colors.transparent,
            Colors.cyanAccent,
          ],
          stretchAlongAxis: true,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(
                        getController.imagesThemes[index]),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "abcd",
                  style: TextStyle(
                      color: Colors.white, fontSize: 25,fontFamily: getController.fonts[getController.fontsSelectIndex.value]),
                ),
              ],
            ),
          ),
        ),
      );
    },
    options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 9 / 12,
        enlargeCenterPage: true,
        initialPage: getController.imageSelectIndex.value,
        animateToClosest: true),
  );
}

//TODO font open and close slide and all fonts parameter set
Padding fontsPaddingSlide(GetController getController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 13),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            getController.fonts.length,
                (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: (index !=
                    getController
                        .fontsSelectIndex.value)
                    ? fontsPaddingColorPurpleGestureDetectorOne(getController, index)
                    : fontsContainerColorBlueTwo(getController, index),
              );
            },
          )
        ],
      ),
    ),
  );
}
// TODO fonts Color Blue
Container fontsContainerColorBlueTwo(GetController getController, int index) {
  return Container(
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(10),
                    color: Colors.red
                        .withOpacity(0.2)),
                child: Padding(
                  padding:
                  const EdgeInsets.all(8.0),
                  child: Text(
                    getController.fonts[index]
                        .toString()
                        .substring(0, 6),
                    style: TextStyle(
                        fontFamily: getController
                            .fonts[index],
                        fontSize: 15),
                  ),
                ),
              );
}

//TODO fonts Color Purple
GestureDetector fontsPaddingColorPurpleGestureDetectorOne(GetController getController, int index) {
  return GestureDetector(
                onTap: () {
                  getController.selectIndexMethod(index: index, setIndex: getController.fontsSelectIndex);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(10),
                      color: Colors.purple
                          .withOpacity(0.2)),
                  child: Padding(
                    padding:
                    const EdgeInsets.all(8.0),
                    child: Text(
                      getController.fonts[index]
                          .toString()
                          .substring(0, 6),
                      style: TextStyle(
                          fontFamily: getController
                              .fonts[index],
                          fontSize: 15),
                    ),
                  ),
                ),
              );
}

// TODO Theme AppBar #Praful
Padding popThemesPageHeaderPadding(double width) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      height: 60,
      width: width,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.navigate_before)),
          const Spacer(),
          const Text(
            "Themes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: width * 0.1,
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}