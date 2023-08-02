import 'dart:io';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:celeto/Resources/config.dart';
import 'package:celeto/Resources/mytheme.dart';
import 'package:celeto/Views/bodyViews/accountspage.dart';
import 'package:celeto/Views/bodyViews/downloadspage.dart';
import 'package:celeto/Views/bodyViews/settingspage.dart';
import 'package:celeto/Views/bodyViews/watchlist.dart';
import 'package:celeto/Views/signupViews/signin_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:image_picker/image_picker.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _saveImage;
  var selectedImagePath = '';
  File? image;
  File? imageFile;
  final ImagePicker _chooseImage = ImagePicker();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mytheme.isDark == true ? const Color(0xFF2E4053) : const Color(0xFFEAEAEA),
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const SizedBox(height: 10,),
                  AvatarGlow(endRadius: 90,
                  glowColor: Mytheme.isDark == true ? Color(0xFFCD7F32) : Colors.blue,
                  child: profileWidget()),
                 // InkWell(
                 //   onTap: (){},
                 //   child: const ProfilePicture(name: "Jana",
                 //       radius: 40,
                 //       fontsize: 25,
                 //     random: true,
                 //   ),
                 // ),
                  const SizedBox(height: 5,),
                   Text('UserName',style: TextStyle(color: Mytheme.isDark == false ? const Color(0xFFCD7F32) : Colors.white,fontSize: 20),),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 650,
                    child: Column(
                      children: [
                        listTileWidget(heading:  Text('Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Mytheme.isDark == false ? const Color(0xFFCD7F32) : Colors.white),), onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  const AccountsPage()),
                          );
                        }),
                         Divider(
                          color:Mytheme.isDark == false ? const Color(0xFF2E4053) : Colors.white,
                          thickness: 2,
                        ),
                        listTileWidget(heading:  Text('App Settings',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Mytheme.isDark == false ? const Color(0xFFCD7F32) : Colors.white),), onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>   const SettingPage()));
                        }),
                         Divider(
                          color:Mytheme.isDark == false ? const Color(0xFF2E4053) : Colors.white,
                          thickness: 2,
                        ),
                        listTileWidget(heading:  Text('Watchlist',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Mytheme.isDark == false ? const Color(0xFFCD7F32) : Colors.white),), onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  const WatchListPage()),
                          );
                        }),
                         Divider(
                          color:Mytheme.isDark == false ? const Color(0xFF2E4053) : Colors.white,
                          thickness: 2,
                        ),
                        listTileWidget(heading:  Text('Downloads',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Mytheme.isDark == false ? const Color(0xFFCD7F32) : Colors.white),), onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  const DownloadsPage()),
                          );
                        }),
                         Divider(
                          color:Mytheme.isDark == false ? const Color(0xFF2E4053) : Colors.white,
                          thickness: 2,
                        ),
                        listTileWidget(heading:  Text('Help',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Mytheme.isDark == false ? const Color(0xFFCD7F32) : Colors.white),), onTap: (){}),
                         Divider(
                          color:Mytheme.isDark == false ? const Color(0xFF2E4053) : Colors.white,
                          thickness: 2,
                        ),
                        listTileWidget(heading:  Text('Logout',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Mytheme.isDark == false ? const Color(0xFFCD7F32) : Colors.white),), onTap: (){
                          // Navigator.pop(context);
                          ShowLogoutDialog();
                        }),
                      ],
                    ),
                  )

                ],
              ),
              Positioned(
                left: 340,
                  child: IconButton(onPressed: (){
                    setState(() {
                      currentTheme.switchTheme();
                    });
                  }, icon: const Icon(
                       Icons.mode_night_rounded),
                    color: Mytheme.isDark == true ? Colors.white : Colors.black,
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> ShowLogoutDialog() async{
     return showDialog<void>(context: context,
       barrierDismissible: false,
       builder: (BuildContext context){
          return AlertDialog(
            backgroundColor:  Mytheme.isDark == true ? Colors.white : Colors.black,
            titlePadding: EdgeInsets.symmetric(horizontal: 100,vertical: 10),
            title: CircleAvatar(
              radius: 35,
              backgroundImage: Mytheme.isDark == true ? AssetImage('assets/images/logout_orange.jpg') : AssetImage('assets/images/logout_blue.jpg'),
            ),
            content:  SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure want to Logout?',style: TextStyle(fontSize: 20,color: Mytheme.isDark == true ? Colors.black : Colors.white),),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child:  Text('No',style: TextStyle(fontSize: 20,color: Mytheme.isDark == true ? Colors.deepOrange : Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child:  Text('Yes',style: TextStyle(fontSize: 20,color: Mytheme.isDark == true ? Colors.deepOrange : Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>   const SigninPage()));
                },
              ),
            ],
          );
       }

     );
  }


  Widget listTileWidget({required heading,required onTap}){
    return ListTile(
      title: heading,
      onTap: onTap,
      textColor:Colors.white,
      trailing:  Icon(Icons.arrow_forward,color:  Mytheme.isDark == false ? Colors.black : Colors.white,),
    );
  }

  Widget bottomSheet(){
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          const Text(
            'Choose Profile Photo From',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            GestureDetector(
              onTap: () async {
                selectedImagePath = await selectImageFromCamera();
                if(selectedImagePath != ''){
                   Navigator.pop(context);
                   setState(() {});
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("No Image Selected !"),
                  ));
                }
              },
              child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/camera.png',
                      height: 60,
                      width: 60,
                    ),
                    const Text('Camera'),
                  ],
                ),
              ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('OR',style: TextStyle(
                  fontSize: 25,
                  color: Mytheme.isDark == true ? const Color(0xFF2E4053) : const Color(0xFFEAEAEA)
                ),),
              ),
      GestureDetector(
        onTap: () async {
          selectedImagePath = await selectImageFromGallery();
          if(selectedImagePath != ''){
            Navigator.pop(context);
            setState(() {});
          } else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No Image Selected !')));
          }
        },
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/gallery.png',
                  height: 60,
                  width: 60,
                ),
                const Text('Gallery'),
              ],
            ),
          ),
        ),
      )
            ],
          )
        ],
      ),
    );
  }



  Widget profileWidget(){
    return Stack(
      children: [
        CircleAvatar(
          radius: 80.0,
          backgroundImage: selectedImagePath  != '' ? FileImage(File(selectedImagePath))  : const AssetImage('assets/images/batman3.jpg') as ImageProvider,
          // backgroundImage: image != null ? FileImage(imageFile!) as ImageProvider :const AssetImage('assets/images/batman.jpg') ,
        ),
        Positioned(
            right: 20,
            bottom: 20,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: (BuildContext context) {
                 return bottomSheet();
                },);
              },
                child: Icon(Icons.camera_alt_rounded,color: Mytheme.isDark == true ? const Color(0xFF02426f) : const Color(0xFF02426f),size: 35.0,)))
      ],
    );
  }
  selectImageFromGallery() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 20);
    if(file != null){
      return file.path;
    } else {
      return '';
    }
  }
  selectImageFromCamera() async{
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 10);
    if(file != null){
      return file.path;
    }else{
      return '';
    }
  }

}

