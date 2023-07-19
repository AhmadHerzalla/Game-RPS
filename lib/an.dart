import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class my_an extends StatefulWidget {
  const my_an({super.key});

  @override
  State<my_an> createState() => _my_anState();
}

class _my_anState extends State<my_an> {
  double scale=1;
   double tt=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: AnimatedRotation(
        duration: Duration(seconds: 1),
        turns: tt,
        curve: Curves.bounceIn,
        child: TextButton(
          onPressed: () { 
            setState(() {
              tt=2;
            });
          
          Timer(Duration(seconds: 1), () {
            setState(() {
              tt=0;
            });
           });
         },
        child: Icon(Icons.access_alarm,size: 60,),),
      )
      )


//        Center(
//         child: AnimatedScale(
//           duration: const Duration(milliseconds: 250),
//           scale:scale ,
          
//           child: TextButton(
//             onPressed: () {
// setState(() {
//   scale+=2;
//   Timer(const Duration(milliseconds: 250), () { 
//     setState(() {
      
//       scale=1;
//     });
//   });
// });
                         
//               },
//           child: Icon(Icons.access_alarm)),
//         ),
//       ),
    );
  }
}