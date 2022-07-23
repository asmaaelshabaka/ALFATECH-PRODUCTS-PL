import 'package:alfatech/core/view-model/profile_view_model.dart';
import 'package:alfatech/view/auth/login_screen.dart';
import 'package:alfatech/view/widgets/custom_Button.dart';
import 'package:alfatech/view/widgets/custom_txt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewMobel>(
        init: ProfileViewMobel(),
        builder: (controller) => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                body: Container(
                    padding: EdgeInsets.only(top: 50),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: controller.userModel == null
                                              ? AssetImage(
                                                  'assets/images/personIcon.png')
                                              : controller.userModel.Pic ==
                                                      'default'
                                                  ? AssetImage(
                                                      'assets/images/personIcon.png')
                                                  : NetworkImage(controller
                                                          .userModel.Pic
                                                          .toString())
                                                      as ImageProvider),
                                    )),
                                // FlatButton(
                                //     onPressed: () {
                                //       controller.signOut();
                                //       Get.offAll(LoginScreen());
                                //     },
                                //     child: Text('Sign Out'))
                                 Column(
                                   children: [
                                     CustomTxt(
                                         controller.userModel.Name.toString(),
                                        Colors.black,
                                         18,
                                         1,
                                        Alignment.topLeft),
                                   CustomTxt(controller.userModel.Email.toString(),
                                         Colors.black, 18, 1, Alignment.topLeft)
                                ],
                                 )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            child: FlatButton(
                              onPressed: () {},
                              child: ListTile(
                                title: CustomTxt('Edit Profile', Colors.black,
                                    16, 1, Alignment.center),
                                leading: Image.asset(
                                    'assets/images/menu_icons/edit-profile.png'),
                                trailing: Icon(Icons.navigate_next,color: Colors.black,),
                              ),
                            ),
                          ),
                          SizedBox(height:20 ,),
                          Container(
                            child: FlatButton(
                              onPressed: () {},
                              child: ListTile(
                                title: CustomTxt('Location', Colors.black,
                                    16, 1, Alignment.center),
                                leading: Image.asset(
                                    'assets/images/menu_icons/location_icon.jpg'),
                                trailing: Icon(Icons.navigate_next,color: Colors.black,),
                              ),
                            ),
                          ),
                          SizedBox(height:20 ,),
                          Container(
                            child: FlatButton(
                              onPressed: () {},
                              child: ListTile(
                                title: CustomTxt('Order History', Colors.black,
                                    16, 1, Alignment.center),
                                leading: Image.asset(
                                    'assets/images/menu_icons/order_icon.png'),
                                trailing: Icon(Icons.navigate_next,color: Colors.black,),
                              ),
                            ),
                          ),
                          SizedBox(height:20 ,),
                          Container(
                            child: FlatButton(
                              onPressed: () {},
                              child: ListTile(
                                title: CustomTxt('cards', Colors.black,
                                    16, 1, Alignment.center),
                                leading: Image.asset(
                                    'assets/images/menu_icons/cards.jpg'),
                                trailing: Icon(Icons.navigate_next,color: Colors.black,),
                              ),
                            ),
                          ),
                          SizedBox(height:20 ,),
                          Container(
                            child: FlatButton(
                              onPressed: () {},
                              child: ListTile(
                                title: CustomTxt('Notifications', Colors.black,
                                    16, 1, Alignment.center),
                                leading: Image.asset(
                                    'assets/images/menu_icons/notifications.jpg'),
                                trailing: Icon(Icons.navigate_next,color: Colors.black,),
                              ),
                            ),
                          ),
                          SizedBox(height:20 ,),
                          Container(
                            child: FlatButton(
                              onPressed: () {controller.signOut();
           Get.offAll(LoginScreen());},
                              child: ListTile(
                                title: CustomTxt('Log Out', Colors.black,
                                    16, 1, Alignment.center),
                                leading: Image.asset(
                                    'assets/images/menu_icons/logOut.png'),
                                trailing: Icon(Icons.navigate_next,color: Colors.black,),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ))));
  }
}
