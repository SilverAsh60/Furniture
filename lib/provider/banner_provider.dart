import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/banner_model.dart';

class BannerProvider with ChangeNotifier {
  List<Banner1> listBanner = [];
  late Banner1 banner;
  List<String> listBannerIMG = [];

  Future<void> getBanner() async {
    List<Banner1> newList = [];
    List<String> newlistBannerIMG = [];

    QuerySnapshot bannerSnaphot = (await FirebaseFirestore.instance.collection("banner").snapshots()) as QuerySnapshot<Object?>;

    for (var element in bannerSnaphot.docs) {
      banner = Banner1(
        id: element["id"].toString(),
        imgURL: element["imgURL"].toString(),
        dateStart: element["dateStart"].toString(),
        dateEnd: element["dateEnd"].toString(),
        status: element["status"].toString(),
      );

      newList.add(banner);
      newlistBannerIMG.add(banner.imgURL.toString());
    }

    listBanner = newList;
    listBannerIMG = newlistBannerIMG;
    notifyListeners();
  }

  List<Banner1> get getListBanner {
    return listBanner;
  }

  List<String> get getListBannerIMG {
    return listBannerIMG;
  }
}
