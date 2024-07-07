// import 'package:clickaeventsp/deshbord/deshbord.dart';
// import 'package:clickaeventsp/screen/main%20manu/mainScreen.dart';
// import 'package:clickaeventsp/screen/widgets/bodyBackground.dart';
// import 'package:flutter/material.dart';
//
// class FrontPageScreen extends StatefulWidget {
//   const FrontPageScreen({super.key});
//
//   @override
//   State<FrontPageScreen> createState() => _FrontPageScreenState();
// }
//
// class _FrontPageScreenState extends State<FrontPageScreen> {
//   List<Events> EventList = [
//     Events(
//         'Wedding Ceremony',
//         'Make Your Wedding Memorable',
//         'https://images.squarespace-cdn.com/content/v1/5aa8c231f8370a37a46dff07/1625000415498-8F86AS02Y20189974WFU/i-FKt6pTd-4K.jpg',
//         0),
//     Events(
//         'Birthday Party',
//         'Make Your Loved once birthday special',
//         'https://img.freepik.com/premium-photo/girl-with-parents-friends-home-celebrating-birthday-firing-confetti-poppers-party_562859-2318.jpg',
//         0),
//     Events(
//         'Anniversary Party',
//         'Make Your Spouse feel loved',
//         'https://5.imimg.com/data5/ANDROID/Default/2022/8/VV/GM/UL/158524229/prod-20220815-1313315379330892639880373-jpg-500x500.jpg',
//         0),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('clickAEvent'),
//         centerTitle: true,
//         backgroundColor: Colors.red,
//         foregroundColor: Colors.black,
//       ),
//       body: SafeArea(
//         child: BodyBackground(
//           child: Column(children: [
//             Expanded(
//               flex: 19,
//               child: SizedBox(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(15),
//                       child: Text(
//                         'Book Your Event',
//                         style: TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                           itemCount: EventList.length,
//                           itemBuilder: (context, index) {
//                             Events events = EventList[index];
//                             return Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Container(
//                                 clipBehavior: Clip.hardEdge,
//                                 height: 120,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(12),
//                                   boxShadow: [const BoxShadow(blurRadius: 0.2)],
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Expanded(
//                                       flex: 45,
//                                       child: AspectRatio(
//                                         aspectRatio: 4 / 7,
//                                         child: ClipRect(
//                                           child: Image.network(
//                                             events.eventPhoto,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 43,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8),
//                                         child: SizedBox(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Expanded(
//                                                 flex: 25,
//                                                 child: Text(
//                                                   '${events.eventTitle}',
//                                                   style: const TextStyle(
//                                                     fontSize: 20,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 flex: 20,
//                                                 child: Text(
//                                                   '${events.eventSubTitle}',
//                                                   style: const TextStyle(
//                                                     fontSize: 11,
//                                                     fontWeight: FontWeight.w400,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 35,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(5),
//                                         child: Align(
//                                           alignment: Alignment.bottomRight,
//                                           child: SizedBox(
//                                             child: Row(
//                                               //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               //crossAxisAlignment: CrossAxisAlignment.end,
//                                               children: [
//                                                 TextButton(
//                                                   onPressed: () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               const Deshbord()),
//                                                     );
//                                                   },
//                                                   child: const Text(
//                                                     'click here',
//                                                     style: TextStyle(
//                                                       color: Colors.red,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
//
// class Events {
//   Events(this.eventTitle, this.eventSubTitle, this.eventPhoto, this.eventCount);
//
//   final eventTitle;
//   final eventSubTitle;
//   final eventPhoto;
//   int eventCount;
// }
