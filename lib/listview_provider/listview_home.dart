import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/listview_provider/detailpage.dart';
import 'package:provider_example/listview_provider/usermodel.dart';
import 'package:provider_example/listview_provider/userprovider.dart';

class ListViewHome extends StatefulWidget {
  const ListViewHome({super.key});

  @override
  State<ListViewHome> createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  TextEditingController nameController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _mainBody()));
  }

  Widget _mainBody() {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
          ),
          TextField(
            controller: imageController,
          ),
          InkWell(
            onTap: () {
              String name = nameController.text;
              String img = imageController.text;

              if (name.isEmpty || img.isEmpty) {
                MotionToast.error(
                        title: Text("Invalid Input"),
                        description: Text("Please enter all details"))
                    .show(context);

                return;
              }

              UserModel user = UserModel(name: name, img: img);
              Provider.of<UserProvider>(context, listen: false)
                  .addUser(user, isRefresh: true);

              nameController.clear();
              imageController.clear();

              MotionToast.success(
                title: Text("Successfully Added"),
                description: Text("Record added successfully"),
              ).show(context);
            },
            child: Container(
              color: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("Add"),
            ),
          ),
          Expanded(child: ListView.builder(
            itemCount: Provider.of<UserProvider>(context,listen: true).users.length,
              itemBuilder: (ctx, index) {

              return itemUser(Provider.of<UserProvider>(context,listen: true).users[index]);

              }))
        ],
      ),
    );
  }

  Widget itemUser(UserModel userModel)
  {
    return InkWell(
      onTap: (){
        print("user : ${userModel.name}");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(user: userModel)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        height: 100,
        color: Colors.blueGrey,
        child: Row(
          children: [
            Image.network(userModel.img,height: 90,),
            SizedBox(width: 20,),
            Text(userModel.name)
          ],
        ),
      ),
    );
  }

}


