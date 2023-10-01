import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/auth/domain/login_controller.dart';
import 'package:news_app/feature/news/presentation/Bloc/internet_cubit/internet_cubit.dart';
import 'package:news_app/feature/news/presentation/pages/entertainment_news.dart';
import 'package:news_app/feature/news/presentation/pages/news_page.dart';
import 'package:news_app/feature/news/presentation/pages/sports_page.dart';
import 'package:news_app/feature/search/news_search.dart';

class AllNewsPage extends StatelessWidget {
   AllNewsPage({Key? key}) : super(key: key);
  String? filepath;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(

          title:  const Text('All News'),
          leading:IconButton(
              onPressed: () {

              },
              icon:  Icon(Icons.search,size: 28,),
              ),

          actions: [


           // IconButton(onPressed: (){}, icon: Icon(Icons.search)),

            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: CircleAvatar(
                radius: 22.0,
                backgroundImage:filepath!=null ? Image.file(File(filepath!)).image: const NetworkImage('https://d2gg9evh47fn9z.cloudfront.net/1600px_COLOURBOX20403753.jpg'),
              ),
            ),


          ],
          centerTitle: true,),

        body:  Column(
          children: [
            BlocConsumer<InternetCubit,InternetState>
            (
            builder:( context, state) {
              if (state == InternetState.gained) {
                return const Text('Internet Connected',style: TextStyle(color: Colors.white),);
              }
              else if (state ==InternetState.lost) {
                return const Text('Internet Disconnected',style: TextStyle(color: Colors.white),);
              }
              else {
                return const Text('Loading...');
              }
            },

            listener: (context,state){
              if(state == InternetState.gained){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Internet Connected',),backgroundColor: Colors.greenAccent,)
                );
              }
              else if( state ==InternetState.lost){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Internet Disconnected',),backgroundColor: Colors.red,)
                );

              }

            }
            ),

            const TabBar(
              indicatorColor: Colors.red,
              //isScrollable: true,
                tabs: [

              Tab(text: 'Top News',),

              Tab(text: 'Entertainment',),

              Tab(text: 'Sports',),


            ]),

            const Expanded(
              child: TabBarView(
                  children:[
                    NewsPage(),

                    EntertainmentNews(),

                    SportsPage(),




              ] ),
            )
          ],
        ),

      ),
    );
  }
}
