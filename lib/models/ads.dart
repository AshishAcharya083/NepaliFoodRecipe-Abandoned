import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:food/constants.dart';

Widget myBannerAd() {
  print("MY BANNER AD CALLED");
  return FacebookBannerAd(
    placementId: placementId,
    bannerSize: BannerSize.STANDARD,
    listener: (result, value) {
      switch (result) {
        case BannerAdResult.ERROR:
          print("Error: $value");
          break;
        case BannerAdResult.LOADED:
          print("Loaded: $value");
          break;
        case BannerAdResult.CLICKED:
          print("Clicked: $value");
          break;
        case BannerAdResult.LOGGING_IMPRESSION:
          print("Logging Impression: $value");
          break;
      }
    },
  );
}

Widget nativeAd() {
  print("MY NATIVE AD CALLED");
  return FacebookNativeAd(
    // height: double.infinity,
    // width: double.infinity,
    height: 300,
    backgroundColor: Colors.blue.shade400,
    placementId: '974319406331493_976012412828859',
    adType: NativeAdType.NATIVE_AD,
    listener: (result, value) {
      print("Native Ad: $result --> $value");
    },
  );
}

Widget biggerNativeAd(){
  return FacebookNativeAd(
                    placementId: '974319406331493_976619072768193',
                    adType: NativeAdType.NATIVE_AD,
                    width: double.infinity,
                    height: 300,
                    backgroundColor: Colors.blue,
                    titleColor: Colors.white,
                    descriptionColor: Colors.white,
                    buttonColor: Colors.deepPurple,
                    buttonTitleColor: Colors.white,
                    buttonBorderColor: Colors.white,
                    listener: (result, value) {
                      print("Native Ad: $result --> $value");
                    },
                    keepExpandedWhileLoading: false,
                    expandAnimationDuraion: 1000,
                  );
}
