import 'dart:io';
import 'package:celeto/Resources/config.dart';
import 'package:celeto/Resources/mytheme.dart';
import 'package:celeto/Views/bodyViews/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:image_picker/image_picker.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _saveImage;
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
                  ProfileWidget(),
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
                        listTileWidget(heading:  Text('Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Mytheme.isDark == false ? const Color(0xFFCD7F32) : Colors.white),), onTap: (){}),
                         Divider(
                          color:Mytheme.isDark == false ? const Color(0xFF2E4053) : Colors.white,
                          thickness: 2,
                        ),
                        listTileWidget(heading:  Text('App Settings',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Mytheme.isDark == false ? const Color(0xFFCD7F32) : Colors.white),), onTap: (){}),
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
                        listTileWidget(heading:  Text('Downloads',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Mytheme.isDark == false ? const Color(0xFFCD7F32) : Colors.white),), onTap: (){}),
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
                          Navigator.pop(context);
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
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: (){
                setState(() {
                  takePhoto(ImageSource.gallery);
                });
              }, icon: Icon(Icons.image), label: Text('Gallery')),
              ElevatedButton.icon(onPressed: (){
                setState(() {
                  takePhoto(ImageSource.camera);
                });
              }, icon: Icon(Icons.camera_alt_sharp), label: Text('Camera'))
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    var pickedFile = await _chooseImage.pickImage(source: source,imageQuality: 50);
    setState(() {

      _saveImage = pickedFile;
    });
  }

  Widget ProfileWidget(){
    return Stack(
      children: [
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _saveImage == null ?  AssetImage('assets/images/batman.jpg') as ImageProvider : FileImage(File(_saveImage.path)),
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
                child: Icon(Icons.camera_alt_rounded,color: Mytheme.isDark == true ? Color(0xFF02426f) : Color(0xFF02426f),size: 35.0,)))
      ],
    );

  }

}

