import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:qoutes_application/controller/get_x_controller.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetController getController =Get.put(GetController());
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(getController.imagesThemes[getController.imageSelectIndex.value]),fit: BoxFit.cover,)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                getController.sectionImageList.length,
                    (index) {
                  return (getController.checkCategory(getController
                      .sectionImageList[index]['category']))
                      ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        getController.dataAddingCategory(
                            getController.sectionImageList[index]
                            ['category']);
                        Get.toNamed("/book_show");
                      },
                      child: AnimatedGradientBorder(
                        gradientColors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.purple.shade50
                        ],
                        glowSize: 2,

                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: height * 0.12,
                          width: width,
                          decoration: BoxDecoration(
                            // color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(getController
                                    .sectionImageList[index]
                                ['image']),
                                fit: BoxFit.cover),
                          ),
                          child: Center(
                            child: Text(
                              getController.sectionImageList[index]
                              ["category"],
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: getController.fonts[
                                getController
                                    .fontsSelectIndex.value],
                                fontSize: 20,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                      : Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
