import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import '../../controller/get_x_controller.dart';

GlobalKey imageKey = GlobalKey();

class SaveAnyPlace extends StatelessWidget {
  const SaveAnyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    GetController getController = Get.put(GetController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: RepaintBoundary(
        key: getController.imageKey.value,
        child: Obx(
          () => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(getController
                        .imagesThemes[getController.imageSelectIndex.value]),
                    fit: BoxFit.cover)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: height,
                  width: width,
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${getController.quote}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: getController
                                  .fonts[getController.fontsSelectIndex.value]),
                        ),
                        // Text(getController.quotesList[0].category),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          getController.another.value,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: getController
                                .fonts[getController.fontsSelectIndex.value],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
            backgroundColor: Colors.black.withOpacity(0.4), //color
            child: const Icon(Icons.storefront),
            fabSize: ExpandableFabSize.regular,
            foregroundColor: Colors.white.withOpacity(0.7)),
        closeButtonBuilder: RotateFloatingActionButtonBuilder(
            backgroundColor: Colors.red.withOpacity(0.3),
            fabSize: ExpandableFabSize.small,
            foregroundColor: Colors.white,
            child: const Icon(Icons.close)),
        type: ExpandableFabType.up,
        overlayStyle: ExpandableFabOverlayStyle(
            color: Colors.black.withOpacity(0.2), blur: 0),
        childrenAnimation: ExpandableFabAnimation.rotate,
        distance: 70,
        // todo buttons
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {
                getController.screenShareImage(2);
              },
              icon: const Icon(Icons.mobile_friendly),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {
                getController.screenShareImage(3);
              },
              icon: const Icon(Icons.phonelink_lock_sharp),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                getController.screenShareImage(4);
              },
              icon: const Icon(Icons.send_and_archive_outlined),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {
                getController.screenShareImage(1);
// Get.back();
              },
              icon: const Icon(Icons.save),
            ),
          ),
        ],
      ),
    );
  }
}
