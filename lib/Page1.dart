import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/dataprovider.dart';

class Page1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${Provider.of<DataProvider>(context,listen: true).msg}',
                style: TextStyle(fontSize: 30),
              ),
              InkWell(
                onTap: () {
                  Provider.of<DataProvider>(context,listen: false).increseCounter();
                  print("clicked1");

                },
                child: Container(
                  color: Colors.orange,
                  padding: EdgeInsets.all(15),
                  child: Text("Click Me"),
                ),
              ),
              InkWell(
                onTap: () {
                  Provider.of<DataProvider>(context,listen: false).increseCounter(isRefresh: false);
                  print("clicked2");

                },
                child: Container(
                  color: Colors.orange,
                  padding: EdgeInsets.all(15),
                  child: Text("Click Me , I will not refresh"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
