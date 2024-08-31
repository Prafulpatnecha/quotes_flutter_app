import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qoutes_application/helper/api_helper.dart';
import 'package:qoutes_application/helper/db_helper.dart';
import 'package:qoutes_application/modal/api_modal.dart';
import 'package:qoutes_application/utils/fonts.dart';
import 'package:qoutes_application/utils/image.dart';
import 'package:share_extend/share_extend.dart';


class GetController extends GetxController
{
  RxBool screenView=true.obs;
  Rx<GlobalKey> imageKey=GlobalKey().obs;
  RxString quote= ''.obs;
  RxString another= ''.obs;
  RxInt findValue= 0.obs;
  RxString addData="Please Add Your Favorite".obs;
  RxBool fontOpenAndClosedBool = false.obs;
  RxInt fontsSelectIndex = 0.obs;//Todo sharedPrafrance
  RxInt imageSelectIndex = 23.obs;//Todo sharedPrafrance
  RxList<ApiModal>? quotesUsing;
  RxList sectionImageList= sectionImage.obs;
  ApiHelper apiHelper = ApiHelper();
  RxList fonts = fontsList.obs;
  RxList imagesThemes = themeImages.obs;
  RxList<ApiModal> quotesList = <ApiModal>[].obs;

  void screenViewNamed()
  {
    screenView.value=false;
  }

  Future<void> screenShareImage(int value)//todo gallery also upload
  async {
      RenderRepaintBoundary boundary = imageKey.value.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List imag = byteData!.buffer.asUint8List();
      // bool result = await WallpaperManager.clearWallpaper();
    if(value==1)
      {
        ImageGallerySaver.saveImage(imag);
      }
    else if(value==2){
      final path = await getApplicationCacheDirectory();
      File file = File("${path.path}/img.png");
      file.writeAsBytes(imag);
      int location= WallpaperManager.HOME_SCREEN;
      bool result=await WallpaperManager.clearWallpaper();
      result=await WallpaperManager.setWallpaperFromFile(file.path, location);
    }
    else if(value==3)
      {
      final path = await getApplicationCacheDirectory();
      File file = File("${path.path}/img.png");
      file.writeAsBytes(imag);
      int location= WallpaperManager.LOCK_SCREEN;
      bool result=await WallpaperManager.clearWallpaper();
      result=await WallpaperManager.setWallpaperFromFile(file.path, location);
      }
    else if(value==4){
        final path = await getApplicationCacheDirectory();
        File file = File("${path.path}/img.png");
        file.writeAsBytes(imag);
        ShareExtend.share(file.path, "image");
      }
  }

  RxList quotesCategoryAddList = [].obs;
  RxList quotesBookData=[].obs;//Todo DataBase
  void saveScreenMethod(String quotess,String anothers,int value)
  {
    quote.value=quotess;
    another.value=anothers;
    findValue.value=value;
  }
  void dataAddingCategory(String category)
  {
    quotesCategoryAddList.clear();
    for(int i=0;i<quotesBookData.length;i++)
    {
      if(quotesBookData[i]['category']==category)
      {
        quotesCategoryAddList.add(quotesBookData[i]);
      }
    }
    // print(quotesCategoryAddList);
    update();
  }
  void categorySet(String category)
  {
    quotesCategoryAddList.clear();
    for(int i=0;i<quotesList.length;i++)
    {
      if(quotesList[i].category==category)
      {
        quotesCategoryAddList.add({"quote":quotesList[i].quote,"author":quotesList[i].author,"index":i,"category":quotesList[i].category});
      }
    }
    // print(quotesCategoryAddList);
    update();
  }
  bool checkCategory(String category)
  {
    bool value = false;
    for(int i=0;i<quotesBookData.length;i++)
    {
      if(quotesBookData[i]['category']==category)
      {
        value=true;
      }
    }
    return value;
  }


  void selectOpenAndClosedBoolMethod(RxBool valueBool)//Todo Fonts
  {
    if(valueBool.value==true)
      {
        valueBool.value = false;
      }
    else{
        valueBool.value = true;
    }
    print(valueBool);
  }
  void selectIndexMethod({required int index,required RxInt setIndex})//TODO font,themesImage
  {
    setIndex.value=index;
    // print(setIndex);
  }
  //TODO Api Calling Data
  Future<RxList<ApiModal>> apiCalling()
  async {
    final list = await apiHelper.apiLinkCalling();// TODO APi Calling comment off
    // String json =await rootBundle.loadString("assets/json/quotes.json");// ToDo Remove json file
    // final list = jsonDecode(json);// ToDo Remove json file
    quotesList.value = list.map((e) => ApiModal.fromJson(e),).toList();
    // quotesUsing!.value = quotesList;// ToDo Remove json file
    return quotesList;
  }
  // GetController()
  // {
  //   apiCalling();
  // }
  // todo Book Mark Check Return BOOL value
  bool bookMarkCheck(RxInt index)// Todo removeRecord
  {
    bool value = false;
    for(int i=0;i<quotesBookData.length;i++)
      {
        if(quotesBookData[i]['bookMark']==index.value.toInt())
          {
            value=true;
          }
      }
    return value;
  }

  //Todo CRUD Operation DataBase Use
  @override
  void onInit()
  {
    initDb();
    super.onInit();
  }

  Future<void> initDb()
  async {
    await DbHelper.dbHelper.database;
    recordData();
  }

  Future<void> insertRecord({required String quote,required String author,required String category,required int bookMark})
  async {
    await DbHelper.dbHelper.insertData(quote: quote, author: author, category: category, bookMark: bookMark);
    recordData();
  }

  Future<RxList> recordData()
  async {
    quotesBookData.value = await DbHelper.dbHelper.readData();
    return quotesBookData;
  }
  // RxList  recordFindList=[].obs;
  // Future<RxList> recordFindData({required String quote})
  // async {
  //   recordFindList.value = await DbHelper.dbHelper.readFindData(quote);
  //   return recordFindList;
  // }
  Future<void> removeRecord({required String quote})
  async {
    await DbHelper.dbHelper.deleteData(quote);
    recordData();
  }

}