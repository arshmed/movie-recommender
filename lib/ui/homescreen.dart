// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:moviee/blocs/movies_bloc.dart';

// import '../model/item_model.dart';
// import 'colors.dart';
// import 'dart:math';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {

//   @override
//   Widget build(BuildContext context) {

//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
//       statusBarIconBrightness:Brightness.light
//     ));

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: ContentPage(),
//     );
//   }
// }

// class ContentPage extends StatefulWidget {
//    ContentPage({Key key}) : super(key: key);
//   AsyncSnapshot<ItemModel> snapshot;
//   @override
//   State<ContentPage> createState() => _ContentPageState();
// }

// class _ContentPageState extends State<ContentPage> {

//   Widget getPopularMovies(){
//     return StreamBuilder(stream: bloc.allMovies, builder: (context, AsyncSnapshot<ItemModel> snapshot) {
//       if (snapshot.hasData) {
//         return TextButton(
//           onPressed: (){
//             return showBottomSheet(context: context, builder: (context){
//               return Container(
//                 color: Colors.black87,
//                 child: Column(
//                   children: [
//                     Container(
//                       //margin: EdgeInsets.only(top: 40),
//                       height: 400,
//                       width: 500,
//                       child: Image.network(snapshot.data.results[0].poster_path,
//                         height: 320,
//                         width: double.infinity,
//                         fit: BoxFit.fill,),
//                     ),
//                     Text(snapshot.data.results[0].title,style: TextStyle(
//                       fontSize: 32,
//                       color: Colors.white,
//                     ),
//                       textAlign: TextAlign.start,
//                     ),
//                   ],
//                 ),
//               );
//             }
//             );
//           },
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: 215,
//             color: bgColor,
//             child: Trends(snapshot),
//           ),
//         );
//       }
//       else if (snapshot.hasError) {
//         print('something went wrong');
//         return Text(snapshot.error.toString());
//       }
//       else
//         return Center(child: CircularProgressIndicator());
//     },
//     );
//   }

//   Widget getTopRatedMovies(){
//     return StreamBuilder(stream: bloc.allTopRatedMovies, builder: (context, AsyncSnapshot<ItemModel> snapshot) {
//       if (snapshot.hasData) {
//         return Container(
//           width: MediaQuery.of(context).size.width,
//           height: 215,
//           color: bgColor,
//           child: Trends(snapshot),
//         );
//       }
//       else if (snapshot.hasError) {
//         print('something went wrong');
//         return Text(snapshot.error.toString());
//       }
//       else
//         return Center(child: CircularProgressIndicator());
//     },
//     );
//   }

//   Widget getUpcomingMovies(){
//     return StreamBuilder(stream: bloc.allUpcomingMovies, builder: (context, AsyncSnapshot<ItemModel> snapshot) {
//       if (snapshot.hasData) {
//         return Container(
//           width: MediaQuery.of(context).size.width,
//           height: 215,
//           color: bgColor,
//           child: Trends(snapshot),
//         );
//       }
//       else if (snapshot.hasError) {
//         print('something went wrong');
//         return Text(snapshot.error.toString());
//       }
//       else
//         return Center(child: CircularProgressIndicator());
//     },
//     );
//   }

//   Widget getNowPlayingMovies(){
//     return StreamBuilder(stream: bloc.allNowPlayingMovies, builder: (context, AsyncSnapshot<ItemModel> snapshot) {
//       if (snapshot.hasData) {
//         return Container(
//           width: MediaQuery.of(context).size.width,
//           height: 210,
//           color: bgColor,
//           child: Trends(snapshot),
//         );
//       }
//       else if (snapshot.hasError) {
//         print('something went wrong');
//         return Text(snapshot.error.toString());
//       }
//       else
//         return Center(child: CircularProgressIndicator());
//     },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     bloc.fetchAllMovies();
//     bloc.fetchAllTopRatedMovies();
//     bloc.fetchAllUpcomingMovies();
//     bloc.fetchAllNowPlayingMovies();
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Stack(children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 1330,
//               color: Colors.black,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Stack(
//                     children: [
//                       Container(
//                       child: StreamBuilder(stream: bloc.allMovies, builder: (context, AsyncSnapshot<ItemModel> snapshot){
//                         if(snapshot.hasData){
//                           return Container(
//                             height: 320,
//                             color: bgColor,
//                             child: ItemsLoad(snapshot),
//                           );
//                         }
//                         else if(snapshot.hasError){
//                           print('something went wrong');
//                           return Text(snapshot.error.toString());
//                         }
//                         else return Center(child: CircularProgressIndicator());
//                       }
//                       ),
//                     ),
//                       Positioned(
//                         right: 5.0,
//                         bottom: 5.0,
//                         child: IconButton(
//                           onPressed: (){},
//                           icon: Icon(
//                         Icons.add,
//                           size: 36,
//                           color: Colors.white,
//                       ),
//                       ),
//                       ),
//                       Positioned(
//                         left: 5.0,
//                         bottom: 2.0,
//                         child: IconButton(
//                           onPressed: (){},
//                           icon: Icon(
//                             Icons.favorite_border,
//                             size: 28,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         right: 50,
//                           left: 52,
//                           bottom: 10,
//                           child: Text('INTERSTELLAR',style: TextStyle(fontSize: 32,fontFamily: 'SubstanceMedium',color: Colors.white)),),
//                   ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       'Trends',
//                       style: TextStyle(
//                       color: Colors.white.withOpacity(0.8),
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                     ),
//                     ),
//                   ),
//                     getPopularMovies(),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
//                     child: Text(
//                       'Top Rated',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.8),
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   getTopRatedMovies(),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
//                     child: Text(
//                       'Upcoming',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.8),
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   getUpcomingMovies(),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
//                     child: Text(
//                       'Now Playing',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.8),
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   getNowPlayingMovies(),
//                 ],
//               ),
//             )
//           ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Trends extends StatefulWidget {

//   AsyncSnapshot<ItemModel> snapshot;
//   Trends(this.snapshot);

//   @override
//   State<Trends> createState() => _TrendsState();
// }

// class _TrendsState extends State<Trends> {
//   @override
//   Widget build(BuildContext context) {

//         return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: widget.snapshot.data.results.length,
//       itemBuilder: (context, index){
//         return Container(
//           height: 200,
//           child: Row(
//             children: [
//               Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10.0),
//                     child: Image.network(
//                         widget.snapshot.data.results[index].poster_path,
//                       height: 210,
//                       width: 140,
//                       //fit: BoxFit.fill,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(width: 8,),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }



// // class ItemsLoad extends StatefulWidget {
// //   AsyncSnapshot<ItemModel> snapshot;
// //   ItemsLoad(this.snapshot);
// //   @override
// //   State<ItemsLoad> createState() => _ItemsLoadState();
// // }
// //
// // class _ItemsLoadState extends State<ItemsLoad> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       scrollDirection: Axis.horizontal,
// //       itemCount: widget.snapshot.data.results.length,
// //       itemBuilder: (context, index){
// //         return Column(
// //           children: [
// //             Image.network(widget.snapshot.data.results[index].poster_path),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }

// class ItemsLoad extends StatefulWidget {
//   AsyncSnapshot<ItemModel> snapshot;
//   ItemsLoad(this.snapshot);
//   @override
//   State<ItemsLoad> createState() => _ItemsLoadState();
// }

// class _ItemsLoadState extends State<ItemsLoad> {

//   @override
//   Widget build(BuildContext context) {
//     Random random = new Random();
//     int randomNumber = random.nextInt(5);
//     return Column(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(20.0),
//           child: Image.network(
//               'https://media.idownloadblog.com/wp-content/uploads/2014/12/interstellar-wide-space-film-movie-art-9-wallpaper.jpg',     //widget.snapshot.data.results[randomNumber].poster_path,
//             height: 320,
//             width: double.infinity,
//             fit: BoxFit.fill,
//           ),
//         ),
//       ],
//     );
//   }
// }


