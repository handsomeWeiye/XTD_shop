import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class LeaderPhone extends StatelessWidget {

  final String leaderImageUrl;
  final String leaderPhoneNum;

  const LeaderPhone({Key key, this.leaderImageUrl, this.leaderPhoneNum}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _callLeaderPhone,
        child: Image.network(leaderImageUrl),
      ),
    );
  }
  void _callLeaderPhone()async{
    String url = 'tel:'+ leaderPhoneNum;
    if (await canLaunch(url)) {
      launch(url);
    }else{
      throw '不能够启动手机电话url';
    }
  }
}
