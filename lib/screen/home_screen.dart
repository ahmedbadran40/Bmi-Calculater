
import 'package:bmi_calclator/enums/gender_enum.dart';
import 'package:flutter/material.dart';
import '../widget/head_title.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
GenderEnum selectedGender=GenderEnum.male;
String result='';
double height =0;
double weight =0;
TextEditingController heightController=TextEditingController();
TextEditingController weightController=TextEditingController();
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void clculaterBmi(double height,double weight) {
     double  finalresult = weight / (height * height/10000);
      String bmi=finalresult.toStringAsFixed(2);
      setState(() {
      result=bmi ;
      });
    }
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar:AppBar(
      backgroundColor: Colors.blue[50],
       // centerTitle: true,
        title: const Text('BMI Calclator',
          style: TextStyle(
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
      body: Column(
        children: [
          const Text('Select Your Gender : ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                     selectedGender=GenderEnum.male;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color:selectedGender==GenderEnum.male?Colors.grey[400]:Colors.green,
                        borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    child: const Text('Man',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white

                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                  selectedGender=   GenderEnum.female;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color:selectedGender==GenderEnum.female?Colors.grey[400]:Colors.green,
                        borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    child: const Text('Woman',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          HeadTitle(text: 'Your Height in Cm : ',),
          TextField(
            controller:heightController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius:BorderRadius.circular(15), ),
              hintText: 'Your Weight in Cm',
            ),
          ),
          HeadTitle(text: 'Your Weight in Cm : '),
          TextField(
            controller:weightController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius:BorderRadius.circular(15), ),
              hintText: 'Your Weight in Cm',
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
            ),
            margin:const EdgeInsets.all(10) ,
            child: ElevatedButton(
              onPressed: (){
                setState(() {
                 double height=double.parse(heightController.value.text);
                  double weight=double.parse(weightController.value.text);
                  clculaterBmi(height, weight);
                });
              }, child: const Text('Calculater',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            ),
            ),
          ),
          const Text('Your BMI is :',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          ),
          Text(result,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
        ],
      ),
    );

  }

  }
