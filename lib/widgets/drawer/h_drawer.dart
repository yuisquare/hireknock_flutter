// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class HDrawer {
//   // static final GlobalKey<ScaffoldState> scaffoldKey =
//   //     GlobalKey<ScaffoldState>();
//   static Widget show(GlobalKey<ScaffoldState> scaffoldKey) {
//     return Drawer(
//       child: ListView(
//         children: [
//           ListTile(
//             title: const Text('Home'),
//             onTap: () {
//               Utils.closeDrawer(scaffoldKey);
//               NavigatorService.replaceAll([QuizScreen()]);
//             },
//           ),
//           ListTile(
//             title: const Text('Manage Batches'),
//             onTap: () {
//               Utils.closeDrawer(scaffoldKey);
//               NavigatorService.replaceAll([BatchScreen()]);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
