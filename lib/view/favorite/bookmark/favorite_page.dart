import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qoutes_application/controller/get_x_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    GetController getController = Get.put(GetController());
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () {
          Get.offAndToNamed('/');
        }, icon: Icon(Icons.navigate_before)),
        title: Text("Favorite"),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(getController.imagesThemes[getController.imageSelectIndex.value]),fit: BoxFit.cover)
        ),
        child: GetBuilder<GetController>(
          builder: (controller) =>  Padding(
            padding: const EdgeInsets.all(20),
            child: (getController.quotesCategoryAddList.isNotEmpty)?(getController.quotesCategoryAddList.length!=0)?
            PageView.builder(
                allowImplicitScrolling: true,
                scrollDirection: Axis.vertical,
                itemCount: getController.quotesCategoryAddList.length,
                itemBuilder: (context, index) {
                  // if(getController.quotesBookData.isNotEmpty)
                  //   {
                  //   }
                  return Center(
                    child: Container(
                      height: height,
                      width: width,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Spacer(),
                            SizedBox(height: height * 0.1),
                            Text(
                              "${getController.quotesCategoryAddList[index]['quote']}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: getController.fonts[
                                  getController
                                      .fontsSelectIndex.value]),
                            ),
                            // Text(getController.quotesList[0].category),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              getController.quotesCategoryAddList[index]['author'],
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: getController.fonts[
                                getController.fontsSelectIndex.value],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.08,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Todo Download Local Storage -
                                IconButton(
                                    onPressed: () {
                                      getController.saveScreenMethod(getController.quotesList[index].quote,getController.quotesList[index].author,0);
                                      Get.toNamed("/show");
                                    },
                                    icon: Icon(
                                      Icons.download_for_offline_outlined,
                                      size: 30,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                //Todo Like and Dislike -
                                IconButton(
                                    onPressed: () {
                                        getController.removeRecord(quote: getController.quotesCategoryAddList[index]['quote']);
                                        getController.dataAddingCategory(getController.quotesCategoryAddList[index]['quote']);
                                        Get.offAndToNamed('/');
                                        },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                  ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  );
                },
              ):Center(
              child: Container(
                height: height,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Spacer(),
                    SizedBox(height: height * 0.1),
                    Text(
                      "${getController.quotesCategoryAddList[0]['quote']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: getController.fonts[
                          getController
                              .fontsSelectIndex.value]),
                    ),
                    // Text(getController.quotesList[0].category),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      getController.quotesCategoryAddList[0]['author'],
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: getController.fonts[
                        getController.fontsSelectIndex.value],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Todo Download Local Storage -
                        IconButton(
                            onPressed: () {
                              getController.saveScreenMethod(getController.quotesList[0].quote,getController.quotesList[0].author,0);
                              Get.toNamed("/show");
                            },
                            icon: Icon(
                              Icons.download_for_offline_outlined,
                              size: 30,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        //Todo Like and Dislike -
                        IconButton(
                          onPressed: () {
                            getController.removeRecord(quote: getController.quotesCategoryAddList[0]['quote']);
                            getController.dataAddingCategory(getController.quotesCategoryAddList[0]['quote']);
                            Get.offAndToNamed('/');
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ):Container(),
            ),
        ),
        ),
    );
  }
}
