import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import '../../Resources/mytheme.dart';
class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});
  @override
  State<AccountsPage> createState() => _AccountsPageState();
}
class _AccountsPageState extends State<AccountsPage> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Mytheme.isDark == true ? const Color(0xFF2E4053) : const Color(0xFFEAEAEA),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                     height: 300,
                     decoration: const BoxDecoration(
                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                       image: DecorationImage(image: AssetImage('assets/images/accountheader2.jpg'),fit: BoxFit.fill)
                     ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){},
                        child: const ProfilePicture(name: "User",
                          radius: 60,
                          fontsize: 25,
                          random: true,
                        ),
                      ),
                    ),),
                  const Positioned(
                    top: 130,
                      left: 90,
                      child: Text('Hello, User',style: TextStyle(color: Color(0xFF2E4053),fontSize: 40,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Mytheme.isDark == true ? const Color(0xFFCD7F32) : const Color(0xFF2E4053),
                    fixedSize: const Size(150, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),),),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
