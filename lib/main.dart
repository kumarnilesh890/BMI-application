import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade900),
        useMaterial3: true,
      ),
      home: const Center(child: Center(child: MyHomePage(title: 'YourBMI',))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
var wtController = TextEditingController();
var ftController = TextEditingController();
var inController = TextEditingController();

var result = "";
var bgColor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700,
                ),),

                const SizedBox(height: 11,),

                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text('Enter your weight in Kg'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 11,),


                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text('Enter your Height (in feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 11,),


                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    label: Text('Enter your Height (in inch)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 16,),

                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){



                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;

                    var tCm = tInch*2.54;

                    var tM = tCm/100;

                    var bmi = iWt/(tM*tM);

                    var msg = "";

                    if(bmi>25){
                      msg = "You are Overweight !!";
                      bgColor = Colors.orange.shade200;

                    }else if(bmi<18) {
                      msg = "You are UnderWeight!!";
                      bgColor = Colors.red.shade200;

                    }else {
                      msg = "You're Healthy!!";
                      bgColor = Colors.green.shade200;

                    }

                    setState(() {

                      result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";

                    });




                  }else {
                    setState(() {
                      result = "Please fill all the required blanks!!";
                    });

                  }


                }, child: Text('Calculate')),

                SizedBox(height: 11,),

                Text(result, style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      )



    );
  }
}
