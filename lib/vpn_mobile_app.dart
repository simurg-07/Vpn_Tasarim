import 'package:flutter/material.dart';
import 'package:vpnmobile/vpn_home_page.dart';

class VpnMobileApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VpnHomePage(),
    );
  }


}