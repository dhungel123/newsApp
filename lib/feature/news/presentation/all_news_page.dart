import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/news/presentation/Bloc/internet_cubit/internet_cubit.dart';
import 'package:news_app/feature/news/presentation/pages/entertainment_news.dart';
import 'package:news_app/feature/news/presentation/pages/news_page.dart';
import 'package:news_app/feature/news/presentation/pages/sports_page.dart';

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

          actions: [

           // IconButton(onPressed: (){}, icon: Icon(Icons.search)),

            CircleAvatar(
              radius: 25.0,
              backgroundImage:filepath!=null ? Image.file(File(filepath!)).image: const NetworkImage('https://lh3.googleusercontent.com/pw/AIL4fc9656yZOp6lca1UvOcKroYVBqWPW6h6merKbDwZng9Km74wlsGYMRN12v6G0vgtF0BYqa2B-OOqmwO8wQB8Ef8Wap7sHQR4nKog5rNozAb6sSNTdyCJMbRYw1f_9GbpW4uM5EMDMlu13SCULjTrBj7pKneFxpwo5Lymj1KwDt4F8I98r412dmxatOJ6oETY2SdSTzudS-l30amMtSdYCdPc24aR4yt5fgH1T3spGnGk69FpoE8TtR9faRUkv7VLEXboUmXxAnVoibTchyz9r-WqrRJ2t5mnlUZebAOzeuH7u7-5IjY7iYiUSP_nEcKfeQMEz9Yk01mTxHJcAFb1a_zhIsxd9wXrvKMYjNe1w6I67wIl-wPLU-l87JgTTMeiaJo7NkF0sbi45IbUSjW3A-h0jC9XFJ_SDairX6KH2W2Lytf-8m6KEXVqHgvHTo0aTvEYutQ14zkZiNQDBq0NLmpLza2s1m19JI1ml5xmEPyjRUeIue4EEhk2EgGffxtyCatxZpWMjlyaPVhMSXjyFvvmFXv09mxxg2LL1BHaEkltiPv6fTssVa2VqpJZ0VyezgsC3KsM0R9S22DK-G75soRKKzJQ7pKWY_7HCkWYwc0mV_zhaqfr69PLvFSC_yq4vnkP_i9tJMIMnHSy9n0exxUVMs0HjVRJrvX_laZVwzZRyeBQ9MXH2AMXYDTj1jM21hlWLyq4DcM3gZ1efydM-doHV52tCka1-R_HNgXBSW8x36fS3Uxj_KVdyYsVpV7qioIR_Cm5hEqlFwLLLoHdnxSoMS7o1Ak7QAHmAc1ts6biVDG276-FsCMz6HJ8N8dDxwJ6xIa-V9u8ZtWV2pGwLxndVNzikHHroG2yT03tU-TNR3oSYEhxqVsk71I0gAg6L2-ypJXmDlzfoVM0jxvSTx9RegHF7QGv68FlkDohtOXpNU5TkZZtzmGxCUcjE_8a4id-Zi72qEnqOH_C8Ihzts1pphhFaw=w1204-h893-s-no?authuser=2'),
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
