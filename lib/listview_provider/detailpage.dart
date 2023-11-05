import 'package:flutter/material.dart';
import 'package:provider_example/listview_provider/usermodel.dart';

class DetailPage extends StatefulWidget {

 final UserModel user;
 DetailPage({required this.user});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _mainBody(),
      ),
    );
  }

  Widget _mainBody(){
    return Container(
        width: double.maxFinite,
        child: Column(
          children: [

            Image.network(widget.user.img),
            Text(widget.user.name,style: TextStyle(
              fontSize: 25
            ),)


          ],
        ));
  }
}
