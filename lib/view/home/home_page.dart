import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:qoutes_application/controller/get_x_controller.dart';

import 'components/home_components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GetController getController = Get.put(GetController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(
        () => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              // 13,19,23
              image: DecorationImage(
                  image: AssetImage(getController
                      .imagesThemes[getController.imageSelectIndex.value]),
                  fit: BoxFit.cover)),
          child: FutureBuilder(
            future: getController.apiCalling(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                getController.quotesList = snapshot.data!; //Todo api snap
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: PageView.builder(
                    allowImplicitScrolling: true,
                    scrollDirection: Axis.vertical,
                    itemCount: getController.quotesList.length,
                    itemBuilder: (context, index) {
                      // if(getController.quotesBookData.isNotEmpty)
                      //   {
                      //   }
                      return Center(
                        child: Container(
                          height: height,
                          width: width,
                          child: Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Spacer(),
                                SizedBox(height: height * 0.1),
                                Text(
                                  "${getController.quotesList[index].quote}",
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
                                  getController.quotesList[index].author,
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
                                    Obx(
                                      () => IconButton(
                                        onPressed: () {
                                          if(!getController.bookMarkCheck(index.obs)||getController.quotesBookData.isEmpty)
                                            {
                                              getController.insertRecord(
                                                  quote: getController
                                                      .quotesList[index].quote,
                                                  author: getController
                                                      .quotesList[index].author,
                                                  category: getController
                                                      .quotesList[index].category,
                                                  bookMark: index);
                                              // getController.removeRecord(quote: getController.quotesList[index].quote.obs);
                                            }
                                          else{
                                              getController.removeRecord(quote: getController.quotesList[index].quote);
                                          }
                                        },
                                        icon: (!getController.bookMarkCheck(index.obs))
                                            ? const Icon(
                                                Icons.favorite_border,
                                                size: 30,
                                              )
                                            : Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 30,
                                              ),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    //Todo send Any Person -
                                    // IconButton(
                                    //     onPressed: () {
                                    //       getController.saveScreenMethod(getController.quotesList[index].quote,getController.quotesList[index].author,1);
                                    //       Get.toNamed("/show");
                                    //     },
                                    //     icon: Icon(
                                    //       Icons.schedule_send_outlined,
                                    //       size: 30,
                                    //     )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                // getController.quotesList = getController.apiCalling();
                return Center(
                  child: CircularProgressIndicator(),
                );
                // return Padding(
                //   padding: const EdgeInsets.all(20),
                //   child: PageView.builder(
                //     allowImplicitScrolling: true,
                //     scrollDirection: Axis.vertical,
                //     itemCount: getController.quotesList.length,
                //     itemBuilder: (context, index) {
                //       return Center(
                //         child: Container(
                //           height: height,
                //           width: width,
                //           child: Obx(
                //             () => Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 // Spacer(),
                //                 SizedBox(height: height*0.1),
                //                 Text("${getController.quotesList[index].quote}",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontFamily: getController.fonts[getController.fontsSelectIndex.value]),),
                //                 // Text(getController.quotesList[0].category),
                //                 SizedBox(
                //                   height: 20,
                //                 ),
                //                 Text(getController.quotesList[index].author,style: TextStyle(fontSize: 16,fontFamily: getController.fonts[getController.fontsSelectIndex.value],),),
                //                 SizedBox(height: height*0.08,),
                //                 Row(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     //Todo Download Local Storage -
                //                     IconButton(onPressed: () {
                //
                //                     }, icon: Icon(Icons.download_for_offline_outlined,size: 30,)),
                //                     SizedBox(width: 10,),
                //                     //Todo Like and Dislike -
                //                     IconButton(onPressed: () {
                //
                //                     }, icon: Icon(Icons.favorite_border,size: 30,)),
                //                     SizedBox(width: 10,),
                //                     //Todo send Any Person -
                //                     IconButton(onPressed: () {
                //
                //                     }, icon: Icon(Icons.schedule_send_outlined,size: 30,)),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // );
              }
            },
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: floatingActionButtonHome(),
    );
  }
}
