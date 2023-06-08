// import 'package:flutter/material.dart';
// import 'package:matchpets/model/pet_list_model.dart' as PetListModel;

// class PetCard extends StatelessWidget {
 

//   const PetCard({
//     super.key,
    
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Container(
//         width: double.infinity,
//         height: 400.0,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           image: DecorationImage(
//             image: AssetImage('asset/images/logo.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Container(
//                 padding: EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10.0),
//                   ),
//                   gradient: LinearGradient(
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                     colors: [
//                       Colors.black.withOpacity(0.8),
//                       Colors.transparent,
//                     ],
//                   ),
//                 ),
//                 child: Text(
//                   pet.name.toString(),
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
