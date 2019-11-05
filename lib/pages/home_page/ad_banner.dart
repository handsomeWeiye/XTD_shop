import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  final String adBannerImageUrl;
  const AdBanner({Key key, this.adBannerImageUrl}) : super(key: key);@override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adBannerImageUrl),
    );
  }
}