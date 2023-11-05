import 'package:flutter/foundation.dart';
import 'package:provider_example/listview_provider/usermodel.dart';

class UserProvider extends ChangeNotifier{

  List<UserModel> users=[];

  void addUser(UserModel user,{bool isRefresh=true}){
    users.add(user);

    print("user list : ${users.length}");

    if(isRefresh)notifyListeners();
  }

  List<UserModel> getUser(){
    return users;
  }

}