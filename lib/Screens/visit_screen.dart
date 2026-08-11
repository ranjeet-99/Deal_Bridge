import 'package:flutter/material.dart';

class VisitScreen extends StatefulWidget{

  const VisitScreen({super.key});

  @override

  State<VisitScreen> createState() => _VisitScreenState();

}

class _VisitScreenState extends State<VisitScreen>{

  final _formkey = GlobalKey<FormState>();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedPurpose;
  DateTime? followUpDate;
  String? selectedStatus;

  final TextEditingController notesController = TextEditingController();
  final TextEditingController employeeController = TextEditingController();

  Future<void> selectDate() async{

   final pickedDate = await showDatePicker(

      context: context,

      firstDate: DateTime.now(),
      lastDate: DateTime(20507 ),
       initialDate: DateTime.now(),

      );

   if(pickedDate != null){

     setState((){

       selectedDate = pickedDate;

  });

  }

}

Future<void> selectTime() async{

    final pickedTime = await showTimePicker(

      context: context,

    initialTime: TimeOfDay.now(),

    );

   if(pickedTime != null){

     setState((){

       selectedTime = pickedTime;

     });

   }

}

Future<void> selectFollowUpDate() async{

    final pickedDate = await showDatePicker(

      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),

    );

    if(pickedDate != null){

      setState((){

        followUpDate = pickedDate;

      });

    }

}

  @override

  void dispose(){

    notesController.dispose();
    employeeController.dispose();
    super.dispose();

  }

  Widget build(BuildContext context){

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding: const EdgeInsets.all(20),

          child:Column(

            crossAxisAlignment: CrossAxisAlignment.start,

          children:[

            Row(

              children:[

                Container(

                  width:40,
                  height:40,

                  decoration: BoxDecoration(

                  shape: BoxShape.circle,
                  border: Border.all(

                    color: Colors.grey.shade300,

                  ),

                  ),

                  child: IconButton(

                    onPressed:(){

                      Navigator.pop(context);

                    },

                    icon: const Icon(Icons.arrow_back),

                  ),

                ),

                const SizedBox(width: 12),

                const Text(

                  "Log a Visit",
                  style: TextStyle(

                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                  ),

                ),

              ],

            ),

          const SizedBox(height:25),

         Row(

           children:[

             Expanded(

               child: TextFormField(

                 readOnly: true,
                 controller: TextEditingController(

                   text: selectedDate == null ? ""
                                              :"${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                 ),

             decoration: InputDecoration(

               labelText: "DATE",
               suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
               border: OutlineInputBorder(

               borderRadius: BorderRadius.circular(12),

               ),

             ),

             onTap: selectDate,

               ),

             ),

           const SizedBox(width:12),

           Expanded(

             child: TextFormField(

               readOnly: true,

             controller: TextEditingController(

             text: selectedTime == null ? ""
                                        :selectedTime!.format(context),
             ),

             decoration: InputDecoration(

               labelText: "TIME",
               suffixIcon: const Icon(Icons.keyboard_arrow_down),
               border: OutlineInputBorder(

                 borderRadius: BorderRadius.circular(12),

               ),

             ),

             onTap: selectTime,

             ),

           ),

           ],

         ),

         const SizedBox(height: 20),

         DropdownButtonFormField<String>(

           initialValue : selectedPurpose,

           decoration: InputDecoration(

             labelText: "PURPOSE",
             border: OutlineInputBorder(

               borderRadius: BorderRadius.circular(12),

             ),

           ),

          items: const[

            DropdownMenuItem(

              value: "Product Demo",
              child: Text("Product Demo"),

            ),

            DropdownMenuItem(

              value: "Bussiness Meeting",
              child: Text("Bussiness Meeting"),
            ),

            DropdownMenuItem(

              value: "Follow up",
              child: Text("Follow up"),
            ),

            DropdownMenuItem(

              value: "Quotation Discussion",
              child: Text("Quotation Discussion"),

            ),

          ],

           onChanged: (value){

             setState((){

               selectedPurpose = value;

             });

           }

         ),

        const SizedBox(height:20),

        TextFormField(

          controller: notesController,

          maxLines: 4,

          decoration: InputDecoration(

           labelText: "NOTES",
           hintText: "discussed pricing and delivery timelines...",

           border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(12),

           ),

          ),

        ),

        const SizedBox(height:20),

        TextFormField(

          controller: employeeController,

        decoration: InputDecoration(

          labelText: "ASSIGNED EMPLOYEE",
          hintText: "Enter employee name",

          border: OutlineInputBorder(

           borderRadius: BorderRadius.circular(12),

          ),

        ),

          validator: (value){

            if(value == null || value.trim().isEmpty){

              return "Please enter employee name";

            }

            return null;

          }
        ),

         const SizedBox(height:20),

         InkWell(

           onTap: selectFollowUpDate,

           child: InputDecorator(

             decoration: InputDecoration(

               labelText: "FOLLOW-UP-DATE",

               suffixIcon: const Icon(Icons.keyboard_arrow_down,),



             ),

           ),

         ),

          ],

          ),

          ),

        ),

      ),

    );

  }

}