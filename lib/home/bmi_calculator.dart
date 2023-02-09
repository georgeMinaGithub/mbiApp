
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mbi_app_flutter/module/bmi_result.dart';
import 'package:mbi_app_flutter/shared/app_cubit/cubit.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {

  bool isMale = true;
  double height = 100;
  int age = 30;
  int weight = 60;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:  const Center(
          child: Text('BMI Calculator'),
        ),

        actions:  [
          IconButton(
            onPressed: ()
            {
              ModeCubit.get(context).changeAppMode();
            },
            icon:   const  Icon(Icons.light_mode_outlined),
          ),

        ],
        centerTitle: true,
        // backgroundColor: Colors.redAccent,
        leadingWidth: 70,
        toolbarHeight: 50,

      ),

      body: Column(
        children: [

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isMale ? Colors.blueAccent : Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [

                            const Image(
                              image: AssetImage('assets/images/male.jpg'),
                              width: 90,
                              height: 90,
                            ),

                            const SizedBox(height: 5,),

                            Text(
                              'Male',
                              style:Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20,),

                  Expanded(

                    child: GestureDetector(
                      onTap: (){
                       setState(() {
                         isMale = false;
                       });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isMale ? Colors.grey[400] : Colors.blueAccent ,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [

                            const Image(
                              image: AssetImage('assets/images/female.jpg'),
                              width: 90,
                              height: 90,
                            ),

                            const SizedBox(height: 5,),

                            Text(
                              'FeMale',
                              style:Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[400]
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                      Text(
                      'HEIGHT',
                        style:Theme.of(context).textTheme.bodyText1,
                    ),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:  [
                       Text(
                        '${height.round()}',
                         style:Theme.of(context).textTheme.bodyText1,
                      ),

                      const SizedBox(width: 5,),

                       Text(
                        'cm',
                        style:Theme.of(context).textTheme.bodyText1,
                       )
                    ],
                  ),

                    Slider(
                      value: height ,
                      min: 50,
                      max: 220,
                      onChanged: (value){
                        setState(() {
                          height = value;
                        });
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),


          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children:  [

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[400]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            'WEIGHT',
                            style:Theme.of(context).textTheme.bodyText1,
                          ),

                           const SizedBox(height: 5,),

                           Text(
                            '$weight',
                             style:Theme.of(context).textTheme.bodyText1,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                mini: true,
                                heroTag: 'weight_',
                                child:  const Icon(Icons.remove),
                              ),

                              const SizedBox(width: 10,),

                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                heroTag: 'weight+',
                                child:  const Icon(Icons.add),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 20,),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[400]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            'AGE',
                             style:Theme.of(context).textTheme.bodyText1,
                          ),

                          const SizedBox(height: 5,),

                           Text(
                            '$age',
                             style:Theme.of(context).textTheme.bodyText1,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                mini: true,
                                heroTag: 'age_',
                                child:  const Icon(Icons.remove),
                              ),

                              const SizedBox(width: 10,),

                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                heroTag: 'age+',
                                child:  const Icon(Icons.add),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 10,left: 20,right: 20),
            child: SizedBox(
              width:double.infinity,
              height: 50,
              child: MaterialButton(
                  onPressed: (){
                    double result = weight / pow(height / 100, 2);
                    Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) =>   BmiResultScreen(
                        age: age,
                        isMale: isMale,
                        result: result.round(),
                        weight: weight,
                      )
                      )
                    );
                  },
                color: Colors.blueAccent,
                child: const Text(
                  'Calculator',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
