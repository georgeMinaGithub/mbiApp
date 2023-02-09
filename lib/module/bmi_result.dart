

import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {

    final int result ;
    final int age ;
    final int weight ;
    final bool isMale ;

    const BmiResultScreen(
   {Key? key,
     required this.result,
     required this.age,
     required this.weight,
     required this.isMale,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Center(
          child: Text('BMI Result Screen'),
        ),

      ),

      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'Gender :  ${isMale ? 'Male' : 'Female'} ',
               style:Theme.of(context).textTheme.bodyText1,
            ),

            const SizedBox(height: 10,),

            Text(
              'Age :  $age ',
              style:Theme.of(context).textTheme.bodyText1,
            ),

            const SizedBox(height: 10,),

            Text(
              'Weight :  $weight ',
              style:Theme.of(context).textTheme.bodyText1,
            ),

            const SizedBox(height: 40,),

            Text(
              'Result :  $result',
              style:Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),

    );

  }
}
