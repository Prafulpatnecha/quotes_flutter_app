import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';


// TODO floatingActionButton for Use HomePage
ExpandableFab floatingActionButtonHome() {
  return ExpandableFab(
      openButtonBuilder: RotateFloatingActionButtonBuilder(
          backgroundColor: Colors.black.withOpacity(0.4),//color
          child: const Icon(Icons.style_outlined),
          fabSize: ExpandableFabSize.regular,
          foregroundColor: Colors.white.withOpacity(0.7)
      ),
      closeButtonBuilder: RotateFloatingActionButtonBuilder(
          backgroundColor: Colors.red.withOpacity(0.3),
          fabSize: ExpandableFabSize.small,
          foregroundColor: Colors.white,
          child: Icon(Icons.close)
      ),
      type: ExpandableFabType.fan,
      overlayStyle: ExpandableFabOverlayStyle(
          color: Colors.black.withOpacity(0.2),
          blur: 2
      ),
      childrenAnimation: ExpandableFabAnimation.rotate,
      distance: 100,

      // todo buttons
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)
          ),
          child: IconButton(onPressed: () {
            //Todo Theme
            Get.toNamed("/theme");
          }, icon: Icon(Icons.web_stories,color: Colors.white.withOpacity(0.8),)),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)
          ),
          child: IconButton(onPressed: () {
            //Todo BookMark
            Get.toNamed('/book_filter');
          }, icon: Icon(Icons.favorite,color: Colors.white.withOpacity(0.8),)),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)
          ),
          child: IconButton(onPressed: () {
            //TODO topic
            Get.toNamed('/category');
          }, icon: Icon(Icons.auto_awesome_mosaic_outlined,color: Colors.white.withOpacity(0.8),),),
        ),
      ]
  );
}