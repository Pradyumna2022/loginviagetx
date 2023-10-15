import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homePageController = Get.put(HomePageController());

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey, // Co
        items: [

          BottomNavigationBarItem(icon:Icon(Icons.dashboard),label: ''),
          BottomNavigationBarItem(icon:Icon(Icons.search_rounded),label: ''),
          BottomNavigationBarItem(icon:Icon(Icons.add),label: ''),
          BottomNavigationBarItem(icon:Icon(Icons.message),label: ''),
          BottomNavigationBarItem(icon:Icon(Icons.person),label: ''),

        ],
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Center(
          child: SvgPicture.asset(
            'assets/images/prpty-logo.svg',width: Get.width*0.25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.mail,size: 40,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.settings,size: 40)),
              ],
            ),
          )
        ],
      ),
      body: Obx((){
        if(homePageController.isloading.value){
          return Center(child:  CircularProgressIndicator(),);
        }else{
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
                itemCount: homePageController.homepageData.length,
                itemBuilder: (context,index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children:[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Opacity(
                          opacity: 0.8,
                          child: Image.network(
                            'https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.cover,
                            height: Get.height * 0.5,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            padding: EdgeInsets.all(4),
                            child: ClipOval(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage('https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                              ),
                            )

                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ruffles',style: TextStyle(
                                fontSize: 19
                              ),),
                              SizedBox(height: Get.height*0.01,),
                              Text('Sponsored',style: TextStyle(
                                  fontSize: 19,color: Colors.grey[200]
                              ),)
                            ],
                          ),

                        ],
                      ),
                      Positioned(
                          right: 30,top: 40,
                          child: Image.asset('assets/images/Options.png')),
                      Positioned(
                          bottom: 10,left: 40,
                          child: Row(
                            children: [
                              Container(
                               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                                  decoration: BoxDecoration(
                                    color: Colors.black26,borderRadius: BorderRadius.circular(13)
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
                                      Text("10")
                                    ],
                                  )),
                              IconButton(onPressed: (){}, icon: Icon(Icons.comment)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined)),
                            ],
                          )),
                      Positioned(
                          right: 30,bottom: 10,
                          child:IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_add)
                          ),
                      ),
                    ]
                  ),
                  SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Username",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),

                        TextSpan(
                          text:
                          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height*0.01,),
                  Text("View all comment 16",style: TextStyle(
                      color: Colors.white70,fontSize: 20
                  )),
                  SizedBox(height: Get.height*0.01,),

                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
                        ),
                      ),
                      SizedBox(width: Get.width*0.025,),
                      Expanded(
                        child:TextFormField(

                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white24), // Set the focused border color to white
                            ),
                            enabledBorder: OutlineInputBorder(

                            ),
                            suffixIcon: IconButton(
                              onPressed: (){},icon: Icon(Icons.send),
                            ),
                            filled: true,
                            fillColor: Colors.black12, // Set the filled color to grey
                            hintText: 'Add a comment .....',
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height*0.03,),
                ],
              )
              ;
            }),
          );
        }
      })
    );
  }
}
