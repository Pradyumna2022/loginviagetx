

import 'package:get/get.dart';
import 'package:newproject/apiserivces/home_page_api_serivces.dart';
import 'package:newproject/model/home_page_model.dart';

class HomePageController extends GetxController{
  var isloading = true.obs;
  var homepageData = <HomePageModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchHomeData();
  }

  void fetchHomeData() async{
    try{
      isloading(true);
      var dataCollect = await HomePageApi.fetchHomeData();
      if(dataCollect !=null){
        homepageData.value = dataCollect as List<HomePageModel>;
      }
    }finally{
      isloading(false);
    }
  }
}



