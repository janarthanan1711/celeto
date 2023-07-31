import 'package:celeto/Resources/mytheme.dart';
import 'package:flutter/material.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDownload = false;
  bool iStreaming = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Mytheme.isDark == true ? const Color(0xFF2E4053) : const Color(0xFFEAEAEA),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Settings',style: TextStyle(color: Mytheme.isDark == true ? Colors.white : Color(0xFF02426f),fontSize: 25,fontWeight: FontWeight.bold),),
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Video Streaming',style: TextStyle(color: Mytheme.isDark == true ? Colors.white : const Color(0xFFCD7F32),fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Streaming over wifi only',style: TextStyle(color: Mytheme.isDark == true ? Color(0xFFCD7F32) : Color(0xFF2E4053),fontSize: 20),),
                    Switch(
                      // thumb color (round icon)
                      activeColor: Color(0xFFCD7F32),
                      activeTrackColor: Colors.cyan,
                      inactiveThumbColor: Colors.blueGrey.shade600,
                      inactiveTrackColor: Colors.grey.shade400,
                      splashRadius: 50.0,
                      // boolean variable value
                      value: iStreaming,
                      // changes the state of the switch
                      onChanged: (value) => setState(() => iStreaming = value),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text('Downloads',style: TextStyle(color: Mytheme.isDark == true ? Colors.white : const Color(0xFFCD7F32),fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Download over wifi only',style: TextStyle(color: Mytheme.isDark == true ? Color(0xFFCD7F32) : Color(0xFF2E4053),fontSize: 20),),
                    Switch(
                      // thumb color (round icon)
                      activeColor: Color(0xFFCD7F32),
                      activeTrackColor: Colors.cyan,
                      inactiveThumbColor: Colors.blueGrey.shade600,
                      inactiveTrackColor: Colors.grey.shade400,
                      splashRadius: 50.0,
                      // boolean variable value
                      value: isDownload,
                      // changes the state of the switch
                      onChanged: (value) => setState(() => isDownload = value),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text('Language',style: TextStyle(color: Mytheme.isDark == true ? Colors.white : const Color(0xFFCD7F32),fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Display Language',style: TextStyle(color: Mytheme.isDark == true ? Color(0xFFCD7F32) : Color(0xFF2E4053),fontSize: 20),),
                    TextButton(onPressed: (){}, child: Text('Current Language'))
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Search History',style: TextStyle(color: Mytheme.isDark == true ? Color(0xFFCD7F32) : Color(0xFF2E4053),fontSize: 20),),
                    TextButton(onPressed: (){}, child: Text('Clear'))
                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Reset to Default',style: TextStyle(color: Mytheme.isDark == true ? Color(0xFFCD7F32) : Color(0xFF2E4053),fontSize: 20),),
                    TextButton(onPressed: (){}, child: Text('Default Setting'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
