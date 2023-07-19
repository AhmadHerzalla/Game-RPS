
import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  double scale=1;
  double tt=0;

  bool isplay=false;
 int s_sel=0;
   int i_sel=0;
  int i_score=0;
   int s_score=0;
  void play(int x){
      setState(() {
        i_sel=x;
        s_sel=Random().nextInt(3);
      });}
      void time(){
        Timer(Duration(milliseconds: 500), () { 
                    setState(() {
                      scale=1;
                    isplay=false;
                    });
                    
                  });
      }
      

  void score(){
    setState(() {
  if(i_sel==0&&s_sel==1||
   i_sel==1&&s_sel==2||
   i_sel==2&&s_sel==0 ){
    i_score++;
   }
   else if(i_sel==s_sel){
   }
   else{
    s_score++;
   }

   if(i_score==10){
    setState(() {
      showDialog(
        context: context,
         builder: (BuildContext context) {
            return const AlertDialog(
               title: Text('The match is over'),
              content: Text(" you is the winner",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 18),),
              
            );




            }


    );
    });
   }

    });
    
     
  
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text("Rock-paper-scissors game",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white),
            ),
            ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        AnimatedScale(
          duration: Duration(milliseconds: 500),
          scale: isplay?1:0,
          child: AnimatedRotation(
            duration: const Duration(milliseconds: 500),
            turns: isplay?tt=5:tt=0,
            curve: Curves.bounceIn,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                CircleAvatar(backgroundImage: AssetImage("images/btn0.png",),radius: 18,
                       ),
                       SizedBox(width: 8,),
                       CircleAvatar(backgroundImage: AssetImage("images/btn1.png",),radius: 16,
                       ),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(backgroundImage: AssetImage("images/btn2.png",),radius: 16,
                       ),
                ],
              )
          
            ],),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             AnimatedScale(
               duration: Duration(milliseconds: 300),
               scale: isplay?scale=0:scale,
               curve: Curves.bounceIn,
               child: CircleAvatar(backgroundImage: AssetImage("images/btn$i_sel.png",),radius: 56,
               ),
             ),
             Text("VS",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white),
              ),
          AnimatedScale(
            duration: Duration(milliseconds: 500),
            scale: isplay?scale=0:scale,
            child: CircleAvatar(backgroundImage: AssetImage("images/btn$s_sel.png"),radius: 56,
            ),
          ),
          ],
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text("""your score :
         $i_score""",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white),
              ),
                       Text("""system score :
            $s_score""",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white),
              ),
        ],),
        Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 TextButton(
                   onPressed: () { 
                    play(0);
                    
                    score();
                    setState(() {
                    
                    isplay=true;
                  });
                  time();
                    },
                   child: CircleAvatar(backgroundImage: AssetImage("images/btn0.png",),radius: 64,
                   ),
                 ),
                 
              TextButton(
                onPressed: () { 
                  play(1);
                  
                  score();
                  setState(() {
                    
                    isplay=true;
                  });
                  time();
                 },
                child: CircleAvatar(backgroundImage: AssetImage("images/btn1.png"),radius: 64,
                ),
              ),
              ],
              ),
               TextButton(
                 onPressed: () { 
                  play(2);
                  
                  score();
                  setState(() {
                    
                    isplay=true;
                  });
                  time();
                  
                  },
                 child: CircleAvatar(backgroundImage: AssetImage("images/btn2.png"),radius: 64,
                         ),
               ),

          ],
        ),
         
       
      ],),
    );
  }
}